document.addEventListener('DOMContentLoaded', () => {
    const form = document.getElementById('questionsForm');

    form.addEventListener('submit', async (event) => {
        event.preventDefault();

        const formData = new FormData(form);
        const answers = Array.from({ length: 12 }, (_, i) => formData.get((i + 1).toString()) || 'no');
        
        try {
            const response = await fetch('/submit', {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json'
                },
                body: JSON.stringify({ answers })
            });

            if (response.ok) {
                const result = await response.json();
                window.location.href = `/result?tech_category=${result.tech_category}&tech_list=${result.tech_list.join(',')}`;
            } else {
                console.error('Failed to submit the form');
            }
        } catch (error) {
            console.error('Error:', error);
        }
    });
});
