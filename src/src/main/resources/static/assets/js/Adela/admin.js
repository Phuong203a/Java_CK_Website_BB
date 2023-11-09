$('#category').on('change', function () {
    // Get the selected category value
    let selectedCategory = $(this).val();

    // Make an AJAX call to the /get-sub-category API
    $.ajax({
        type: 'GET',
        url: '/api/product/get-sub-category',
        data: { category: selectedCategory },
        success: function (response) {
            // Update the sub-category select options
            let subCategories = response.data.subCategory;
            let subCategorySelect = $('#sub-category');

            // Clear existing options
            subCategorySelect.empty();

            // Add new options based on the API response
            $.each(subCategories, function (index, subCategory) {
                subCategorySelect.append('<option value="' + subCategory + '">' + subCategory + '</option>');
            });
        },
        error: function (error) {
            console.error('Error fetching sub-categories:', error);
        }
    });
});


function confirmDelete(element) {

}