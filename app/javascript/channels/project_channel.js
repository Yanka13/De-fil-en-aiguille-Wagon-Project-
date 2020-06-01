import consumer from "./consumer";

const initProjectCable = () => {
  const principale = document.querySelector('.container-show-project-yannis');
  const messagesContainer = document.getElementById('profile-tab');
  if (messagesContainer) {
    const id = messagesContainer.dataset.projectId;
    consumer.subscriptions.create({ channel: "ProjectChannel", id: id }, {
      received(data) {
        console.log(data); // called when data is broadcast in the cable
          principale.insertAdjacentHTML('beforeend', data);
      },
    });
  }
}

export { initProjectCable };
