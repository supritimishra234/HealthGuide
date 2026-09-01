<?php

header("Content-Type: application/json");

require_once "db.php";

if (!isset($_GET["symptom"])) {
    echo json_encode([
        "success" => false,
        "message" => "No symptom provided"
    ]);
    exit;
}

$symptom = trim($_GET["symptom"]);

if ($symptom === "") {
    echo json_encode([
        "success" => false,
        "message" => "Please enter a symptom"
    ]);
    exit;
}

$words = preg_split('/\s+/', strtolower($symptom));

$words = array_filter($words, function($word) {
    return strlen($word) >= 3;
});

$conditions = [];
$params = [];
$types = "";

foreach ($words as $word) {
    $conditions[] = "LOWER(s.name) LIKE ? OR LOWER(s.keywords) LIKE ?";
    
    $searchTerm = "%" . $word . "%";

    $params[] = $searchTerm;
    $params[] = $searchTerm;

    $types .= "ss";
}

if (empty($conditions)) {
    echo json_encode([
        "success" => false,
        "message" => "Please enter a valid symptom"
    ]);
    exit;
}

$sql = "
    SELECT DISTINCT
        s.name,
        h.title,
        h.description,
        h.self_care,
        h.warning,
        h.source_name,
        h.source_url,
        h.last_verified
    FROM symptoms s
    INNER JOIN health_information h
        ON s.symptom_id = h.symptom_id
    WHERE " . implode(" OR ", $conditions);

$stmt = $conn->prepare($sql);

$stmt->bind_param(
    $types,
    ...$params
);

$stmt->execute();

$result = $stmt->get_result();

$data = [];

while ($row = $result->fetch_assoc()) {
    $data[] = $row;
}

echo json_encode([
    "success" => true,
    "results" => $data
]);

$stmt->close();
$conn->close();

?>