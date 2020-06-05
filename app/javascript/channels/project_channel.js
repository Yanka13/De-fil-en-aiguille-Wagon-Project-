import consumer from "./consumer";
import Swal from 'sweetalert2';


const initProjectCable = () => {
  const principale = document.getElementById('content');
  const messagesContainer = document.getElementById('profile-tab');
  if (messagesContainer) {
    const id = messagesContainer.dataset.projectId;
    consumer.subscriptions.create({ channel: "ProjectChannel", id: id }, {
      received(data) {
        console.log(data); // called when data is broadcast in the cable
          //principale.insertAdjacentHTML('beforeend', data);
          Swal.fire({
            position: 'top-end',
            icon: 'success',
            showCloseButton: true,
            title: data,
            showConfirmButton: false
          })

      },
    });
  }
}

export { initProjectCable };
