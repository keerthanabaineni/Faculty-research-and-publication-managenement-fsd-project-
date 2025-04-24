function selectUser(userType) {
    document.getElementById("user-selection").classList.add("d-none");
    document.getElementById("student-options").classList.add("d-none");
    document.getElementById("faculty-options").classList.add("d-none");

    if (userType === "student") {
        document.getElementById("student-options").classList.remove("d-none");
    } else if (userType === "faculty") {
        document.getElementById("faculty-options").classList.remove("d-none");
    }
}

function showUploadForm() {
    document.getElementById("upload-form").classList.remove("d-none");
    document.getElementById("faculty-search").classList.add("d-none");
}

function showSearchForm() {
    document.getElementById("faculty-search").classList.remove("d-none");
    document.getElementById("upload-form").classList.add("d-none");
}

// Search Publications or Research (for Student Portal)
function searchInfo() {
    let searchType = document.getElementById("search-type").value;
    let facultyName = document.getElementById("faculty-name").value.trim();

    // Normalize spaces & lowercase name
    facultyName = facultyName.replace(/\s+/g, ' ').toLowerCase();

    if (!facultyName) {
        alert("Please enter a faculty name.");
        return;
    }

    let apiEndpoint = (searchType === "research") ? "/searchResearch" : "/searchPublication";

    fetch(`${apiEndpoint}?facultyName=${encodeURIComponent(facultyName)}`)
        .then(response => response.json())
        .then(data => {
            let resultsDiv = document.getElementById("search-results");
            resultsDiv.innerHTML = "";

            if (data.length === 0) {
                resultsDiv.innerHTML = "<p>No results found.</p>";
                return;
            }

            data.forEach(entry => {
                let fileLink = `<a href="${entry.filePath}" target="_blank">Download</a>`;
                resultsDiv.innerHTML += `<p><strong>${entry.title}</strong> - ${fileLink}</p>`;
            });
        })
        .catch(error => console.error('Error fetching search results:', error));
}

// Search Faculty (for Faculty Portal, returns both Research & Publications)
function searchFaculty() {
    let facultyName = document.getElementById("search-faculty-name").value.trim();

    if (!facultyName) {
        alert("Please enter a faculty name.");
        return;
    }

    // Normalize name (remove extra spaces)
    facultyName = facultyName.replace(/\s+/g, ' ').toLowerCase();

    fetch(`/searchFaculty?facultyName=${encodeURIComponent(facultyName)}`)
        .then(response => response.json())
        .then(data => {
            let resultsDiv = document.getElementById("faculty-search-results");
            resultsDiv.innerHTML = "";

            if (data.length === 0) {
                resultsDiv.innerHTML = "<p>No research papers or publications found for this faculty.</p>";
                return;
            }

            data.forEach(entry => {
                let fileLink = `<a href="${entry.filePath}" target="_blank">Download</a>`;
                let typeLabel = (entry.type === "research") ? "📄 Research Paper" : "📜 Publication";

                resultsDiv.innerHTML += `
                    <div class="card p-3 mb-2 border rounded shadow-sm">
                        <h5>${entry.title}</h5>
                        <p><strong>Type:</strong> ${typeLabel}</p>
                        ${fileLink}
                    </div>
                `;
            });
        })
        .catch(error => console.error('Error fetching faculty research & publications:', error));
}
