document.addEventListener('DOMContentLoaded', function () {
    // Media Player Logic
    const video = document.getElementById('custom-video');
    const playPauseBtn = document.getElementById('play-pause-btn');

    if (video && playPauseBtn) {
        playPauseBtn.addEventListener('click', () => {
            if (video.paused) {
                video.play();
                playPauseBtn.innerHTML = '<svg width="24" height="24" viewBox="0 0 24 24" fill="currentColor"><path d="M6 19h4V5H6v14zm8-14v14h4V5h-4z"/></svg>';
            } else {
                video.pause();
                playPauseBtn.innerHTML = '<svg width="24" height="24" viewBox="0 0 24 24" fill="currentColor"><path d="M8 5v14l11-7z"/></svg>';
            }
        });

        // Add progress bar updating, etc if needed here
    }

    const audio = document.getElementById('custom-audio');
    const audioPlayBtn = document.getElementById('audio-play-btn');

    if (audio && audioPlayBtn) {
        audioPlayBtn.addEventListener('click', () => {
            if (audio.paused) {
                audio.play();
                audioPlayBtn.innerHTML = '<svg width="24" height="24" viewBox="0 0 24 24" fill="currentColor"><path d="M6 19h4V5H6v14zm8-14v14h4V5h-4z"/></svg>';
            } else {
                audio.pause();
                audioPlayBtn.innerHTML = '<svg width="24" height="24" viewBox="0 0 24 24" fill="currentColor"><path d="M8 5v14l11-7z"/></svg>';
            }
        });
    }

    // Modal Image Gallery Logic
    const mainImg = document.getElementById('main-gallery-img');
    const thumbnails = document.querySelectorAll('.thumb-img');
    const modal = document.getElementById('lightbox-modal');
    const modalImg = document.getElementById('modal-img');
    const closeBtn = document.querySelector('.close-modal');
    const prevBtn = document.getElementById('prev-btn');
    const nextBtn = document.getElementById('next-btn');

    let currentIndex = 0;

    if (mainImg) {
        thumbnails.forEach((thumb, index) => {
            thumb.addEventListener('click', () => {
                mainImg.src = thumb.src;
                currentIndex = index;
            });
        });

        mainImg.addEventListener('click', () => {
            modal.style.display = "flex";
            modalImg.src = mainImg.src;
        });

        closeBtn.addEventListener('click', () => {
            modal.style.display = "none";
        });

        modal.addEventListener('click', (e) => {
            if (e.target === modal) {
                modal.style.display = "none";
            }
        });

        prevBtn.addEventListener('click', () => {
            currentIndex = (currentIndex === 0) ? thumbnails.length - 1 : currentIndex - 1;
            modalImg.src = thumbnails[currentIndex].src;
            mainImg.src = thumbnails[currentIndex].src;
        });

        nextBtn.addEventListener('click', () => {
            currentIndex = (currentIndex === thumbnails.length - 1) ? 0 : currentIndex + 1;
            modalImg.src = thumbnails[currentIndex].src;
            mainImg.src = thumbnails[currentIndex].src;
        });
    }
});
