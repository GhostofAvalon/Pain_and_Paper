import swal from 'sweetalert';

const initSweetalert = (selector, options = {}) => {
  // console.log('Hello from SweetAlert');
  const swalButton = document.querySelector(selector);
  if (swalButton) { // protect other pages
    swalButton.addEventListener('click', () => {
      swal(options);
    });
  }
};

export { initSweetalert };
