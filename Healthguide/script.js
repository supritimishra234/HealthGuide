function searchSymptoms() {
    const input = document.getElementById("symptomInput");
    const results = document.getElementById("results");
    const loading = document.getElementById("loading");

    const symptom = input.value.trim();

    if (symptom === "") {
        results.innerHTML = `
            <div class="result-card">
                <h2>Please enter a symptom</h2>
                <p>Try entering headache, cough, fever, cold, or sore throat.</p>
            </div>
        `;
        return;
    }

    loading.classList.remove("hidden");
    results.innerHTML = "";

    fetch("api/search.php?symptom=" + encodeURIComponent(symptom))
        .then(response => response.json())
        .then(data => {
            loading.classList.add("hidden");

            if (data.success && data.results.length > 0) {
                displayResults(data.results);
            } else {
                results.innerHTML = `
                    <div class="result-card">
                        <h2>No information found</h2>
                        <p>
                            We couldn't find information for
                            "<strong>${escapeHTML(symptom)}</strong>".
                        </p>
                        <p>
                            Try a common symptom such as headache,
                            cough, fever, cold, or sore throat.
                        </p>
                    </div>
                `;
            }
        })
        .catch(error => {
            console.error(error);

            loading.classList.add("hidden");

            results.innerHTML = `
                <div class="result-card">
                    <h2>Unable to connect</h2>
                    <p>
                        We couldn't retrieve the information.
                        Please try again.
                    </p>
                </div>
            `;
        });
}

function displayResults(resultsData) {
    const results = document.getElementById("results");

    results.innerHTML = resultsData.map(item => `
        <div class="result-card">

            <h2>
                🩺 ${escapeHTML(item.title)}
            </h2>

            <h3>General Information</h3>

            <p>
                ${escapeHTML(item.description)}
            </p>

            <h3>General Self-Care Information</h3>

            <p>
                ${escapeHTML(item.self_care)}
            </p>

            <h3>⚠️ When to Seek Medical Help</h3>

            <p>
                ${escapeHTML(item.warning)}
            </p>

            <div class="source-box">

                <strong>📚 Trusted Source</strong>

                <p>
                    ${escapeHTML(item.source_name)}
                </p>

                <a
                    href="${escapeHTML(item.source_url)}"
                    target="_blank"
                    rel="noopener noreferrer"
                >
                    Read Official Source →
                </a>

            </div>

        </div>
    `).join("");
}

function escapeHTML(text) {
    const div = document.createElement("div");
    div.textContent = text ?? "";
    return div.innerHTML;
}

document.getElementById("symptomInput").addEventListener("keypress", function(event) {
    if (event.key === "Enter") {
        searchSymptoms();
    }
});