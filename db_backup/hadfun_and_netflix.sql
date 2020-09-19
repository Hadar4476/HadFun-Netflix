-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: ספטמבר 19, 2020 בזמן 03:44 PM
-- גרסת שרת: 10.4.11-MariaDB
-- PHP Version: 7.4.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `hadfun_and_netflix`
--

-- --------------------------------------------------------

--
-- מבנה טבלה עבור טבלה `posts`
--

CREATE TABLE `posts` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `show_movie_id` int(11) NOT NULL,
  `post` text NOT NULL,
  `date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- מבנה טבלה עבור טבלה `shows_and_movies`
--

CREATE TABLE `shows_and_movies` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `image` text NOT NULL,
  `logo` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- הוצאת מידע עבור טבלה `shows_and_movies`
--

INSERT INTO `shows_and_movies` (`id`, `title`, `image`, `logo`) VALUES
(1, 'Family Guy', 'https://occ-0-1391-778.1.nflxso.net/dnm/api/v6/X194eJsgWBDE2aQbaNdmCXGUP-Y/AAAABdOmf-HkB5YziOt9OrcVWnw13MltREq0BDv4R7SX6nTY9cH4AARRnhYvtRddDBvUPot4b4usNkvcKVE49zyiJpA1kjg.webp?r=31a', 'https://occ-0-1391-778.1.nflxso.net/dnm/api/v6/tx1O544a9T7n8Z_G12qaboulQQE/AAAABRmp6tbYVdJNjjEH1N_PEjj73EDxJPKM6juIojYlVDFSvpe0M8V9xii930_32nyqiS6QUk4ZDAwmzicYI19F6z_tVobtY0p213M.webp?r=f61'),
(2, 'Rick and Morty', 'https://occ-0-1391-778.1.nflxso.net/dnm/api/v6/X194eJsgWBDE2aQbaNdmCXGUP-Y/AAAABSCWshOVzICqcXi48kL4UN4HNFn8W4D_QhUPZhT55_MNqx7DKtCeeRs8LBC68Ywl-1tukc1OsRdhDKhHsY4Dd950p8w.webp?r=145', 'https://occ-0-1391-778.1.nflxso.net/dnm/api/v6/tx1O544a9T7n8Z_G12qaboulQQE/AAAABdU1HNoMTuxMf1XhB7m9TQu63O8pUYHGbzshxgqzO9L349-XXyG1V7ubeO-EI4xo8dlow9U0MWgk7szUgkmIr6D2EI8PLMqBVxc.webp?r=64d'),
(3, 'Bojack Horseman', 'https://occ-0-1391-778.1.nflxso.net/dnm/api/v6/X194eJsgWBDE2aQbaNdmCXGUP-Y/AAAABayZvdorWqoxCP4j6N8HHmpDEMNFW0OKwWv8ZNdvmEeeqiyW4op-d_mMvGUJvpoEveZ8V46d_nVStQlpwD5B4j_UK3rqeNSEg1LiGtPkBwJEXWAR8r3IHUW13b5l.jpg?r=37e', 'https://occ-0-1391-778.1.nflxso.net/dnm/api/v6/tx1O544a9T7n8Z_G12qaboulQQE/AAAABdxPijKHjDoBBGK0CXAoAByJuzuTrT2aCXTqui13DQthPwHpSIjWL6nVrGw8EF4BxgxSEicnJWfG-n-lcFibqGPGgVwWB8F0DhR-aXJcMFvQvAygk_2x0PYP5qXngKpHr8Fc4GEd08Y3d8IHU5rBjPtg3YT5P8yG8fmzOW9bypRY.webp?r=720'),
(4, 'South Park', 'https://occ-0-1391-778.1.nflxso.net/dnm/api/v6/X194eJsgWBDE2aQbaNdmCXGUP-Y/AAAABfODWvB-4p2Dz9MrujUd3jKXYb1Oz5LuHK_HMgqr70I-FLEueoA-SQjfU5SKAgQQomfX-BAF1SVn4P67R_Xrzv608RM.jpg?r=dba', 'https://occ-0-1391-778.1.nflxso.net/dnm/api/v6/tx1O544a9T7n8Z_G12qaboulQQE/AAAABWfj5CsBlbPzUEfAuaagmih4PsiCCidYZ9wpIMIFDklrBVYOnxKLFxLPhpJErwMCD1_uSnR2ewoIzDumnyGXLnYzaMPspRu5yC8.webp?r=ce1'),
(5, 'Brooklyn 99', 'https://occ-0-1391-778.1.nflxso.net/dnm/api/v6/X194eJsgWBDE2aQbaNdmCXGUP-Y/AAAABQO417AoaMguF_DtQ1zOivjKkMZEpP5zA1YFG1zwSewxnHSW3UyRVVbIUbhMdVsXnZzFolmiO9x3tteyklzoM_fZ9VA.webp?r=a8a', 'https://occ-0-1391-778.1.nflxso.net/dnm/api/v6/tx1O544a9T7n8Z_G12qaboulQQE/AAAABeeePBwoOissqGR4gaeKBd8yTmOZbt8u4Oiin67kOqvHxXRgDKd9GOCnDdALvzrRaTSH0U1Wlavg-YaewKRK_4aNSQJ0YpoK8Nk.webp?r=8f4'),
(6, 'Friends', 'https://occ-0-1391-778.1.nflxso.net/dnm/api/v6/X194eJsgWBDE2aQbaNdmCXGUP-Y/AAAABeRIWKUsHR3b8U3iLrx-mVqolEYzq5InBOqNTQUhJb7AqYSlAG0rKfqAxsqMbO-Q2O7B0XiQyVhm9PvGF1eoZi0hSPs.jpg?r=75b', 'https://occ-0-1391-778.1.nflxso.net/dnm/api/v6/tx1O544a9T7n8Z_G12qaboulQQE/AAAABdWm7OQH27GLCNSHPLBjxP3I_i0NhOhmWLTSqtXtaIYwXTHtTbNk0jXUn8eNaXEeViBKGA3Ywb5gvuuSze8zS9ftZEnH0CO60kU.webp?r=584'),
(7, 'How I Met Your Mother', 'https://occ-0-1391-778.1.nflxso.net/dnm/api/v6/X194eJsgWBDE2aQbaNdmCXGUP-Y/AAAABbe_n2UoDaMNi_J4mbCxeo0FLho91XVwGctwIelCCWvOcqrLODUL6FnSVcRgeTTKEGiZlhV3HhZnbUWV8MpDxBK7U18.webp?r=1b2', 'https://occ-0-1391-778.1.nflxso.net/dnm/api/v6/tx1O544a9T7n8Z_G12qaboulQQE/AAAABf1IwUSs2F01nNVZxn3wP8hWwN_v5nDo5udUX-nnDuOGxmUgj26Iz71qPR7J_sy_ifhBTkjkbu1wZ6-gEF8r2oNQ92FhMMrHoXY.webp?r=d1a'),
(8, 'The Big Bang', 'https://occ-0-1391-778.1.nflxso.net/dnm/api/v6/X194eJsgWBDE2aQbaNdmCXGUP-Y/AAAABdY3vB6NNUBKnrmvZBjO97ksHliMt-KioEBCYqckMgesq9plvwbLLZafSCbN-RmotnsYTfr63HFbGjddYZe4JsApK6w.webp?r=248', 'https://occ-0-1391-778.1.nflxso.net/dnm/api/v6/tx1O544a9T7n8Z_G12qaboulQQE/AAAABVf_n0cA3_zMPGO4Z9ghWoP7IA785clPq0Ic3y_dOPcq43nU0vBhp-NG2WDS3Q6SmB7MZmRmeNiGZTGHENKDdouXy2oRb7jQ5Hg.webp?r=bbc'),
(9, 'Big Mouth', 'https://occ-0-1391-778.1.nflxso.net/dnm/api/v6/X194eJsgWBDE2aQbaNdmCXGUP-Y/AAAABdUKkTgRH5wqzejelCq6YA_o3FI5aWWao7gn5JbJob1wvuZBaGqqDZXf8SHTKrLpqKkY2EjKOjBPwydSWDpfSPetm21-EBpyTqhaE6MLPAiiAfvaw4Ula_Uk3d0v.jpg?r=582', 'https://occ-0-1391-778.1.nflxso.net/dnm/api/v6/tx1O544a9T7n8Z_G12qaboulQQE/AAAABTKAShX7B8PkhZMp5OIgcb33-1QqbFjciemxoT1Op6lGuc37KfoXRZosbq8vgQk9e8-ijsy8u8yI9XaeR706k7VPVlVNmLnn9Iy0SoHzYLIR05ORtDLp73U8FPfogbwtxcXptATCTTEODWh0ygrrVQz-oMd9VBEG8QRJd4MBR24g.webp?r=78b'),
(10, 'Lucifer', 'https://occ-0-1391-778.1.nflxso.net/dnm/api/v6/X194eJsgWBDE2aQbaNdmCXGUP-Y/AAAABZhasBM19i3z-3auc2Nt3xTZ21D_6R0REVDqMQaeLIz9dCUbINYvVArrTTi-B5Lk0Z6YUZlILi8Vk0el9kSvpRuqp1PbuXYhuoFTsKL9LBs0eBmdg1ODN110_PTClOWtgzaPmUQ4-Dwy2BYYNwX5lppD_fWH5xAFJwo1jBPfasi11cO1cXEh4b6nfAZLaq4IR2pL6aA4Jz4ylIEINDdQl_Ty.webp?r=62e', 'https://occ-0-1391-778.1.nflxso.net/dnm/api/v6/tx1O544a9T7n8Z_G12qaboulQQE/AAAABbA-ixJNpzQ1zODTHQ3aOjaL18Se4CrXn3wOWqo9LwPfObkrB5PCSi4xW7TqRxCMY71lEH-P2zzctlsv1gbfCHEbMb9j86UwAIYsbdkuDu54uepJfFbGuoR9qDr4VzX6ZMHzVVviqPtiWZxym1WfrBYQ3Vb4WjPTYxYIvqVuQgDp.webp?r=08a'),
(11, 'Breaking Bad', 'https://occ-0-1391-778.1.nflxso.net/dnm/api/v6/X194eJsgWBDE2aQbaNdmCXGUP-Y/AAAABUjsKDiaKwLmrV662pwmVKEtRmbJI-s8M9ojCqr2QEdnPUJPX86RP-n9IGXxGcaHWkTf-cwz5e4kBLN3jYLM7HuBfYA.webp?r=01d', 'https://occ-0-1391-778.1.nflxso.net/dnm/api/v6/tx1O544a9T7n8Z_G12qaboulQQE/AAAABY6EmBvTXqYUxPuRQHWXmHxbw4ZjALTQUy9YBKVH1T_dOP2VymTihVLTH1QbJ_un_iX53F_7wWzsFH9yf_k3KV57t_-BRzv9ykg.webp?r=c0d'),
(12, 'Better Call Saul', 'https://occ-0-1391-778.1.nflxso.net/dnm/api/v6/X194eJsgWBDE2aQbaNdmCXGUP-Y/AAAABfMSqN3xeLRVf7voMPL26Y1PM5mYUFP7SqpDo6oJiuvipCzQUxAeoZrBzgGAgwHAVTUhUQCs7wQ2JhRD9UKlOuVSQMk.jpg?r=91c', 'https://occ-0-1391-778.1.nflxso.net/dnm/api/v6/tx1O544a9T7n8Z_G12qaboulQQE/AAAABfb0q5aNW8GgoZyIwAS79ucZTASEvHbKVeKmVav6PTZRFWCjN-gCLKkE71BY2jrtSFX2laVfjirUuUvd46anooOQAYDl5pSFdkI.webp?r=da8'),
(13, 'Stranger Things', 'https://occ-0-1391-778.1.nflxso.net/dnm/api/v6/X194eJsgWBDE2aQbaNdmCXGUP-Y/AAAABbAJGyjtN3VkGy6a2beSc8L2CyeHN30fMbyeViVew8cVGmbJMPQojMt6zcrNjnKrTaziFlhTeQNcoDuwWRnMpBy0DvnIiQoLG07zdmUOeXA0jpC-fe8VK3QJBRGe.jpg?r=b4e', 'https://occ-0-1391-778.1.nflxso.net/dnm/api/v6/tx1O544a9T7n8Z_G12qaboulQQE/AAAABTAytd1vigKbOPjqKU6DxgabgZoLrjdBz7MaLNmekog0p0h-U7ABf1ccTeNoJ_46ZcPREXOwn06cFBDW5lBu46AeS1jdks0wfIhi_GzIJ4Sc34WhOdNdXJ_7bNaXYAvnMwuDL6d0GZbB0J46IhYI8tMtaNnbkqReYevcWG-LyWFI.webp?r=654'),
(14, 'Fauda', 'https://occ-0-1391-778.1.nflxso.net/dnm/api/v6/X194eJsgWBDE2aQbaNdmCXGUP-Y/AAAABb23tdYMhkc3Whgcx5dik5ecsnGLCfV1OlUQgBhrFmEHtCaFYoyqNFH_Kki30EBfK954BACNeRSSK72vBCBaBViAoc4.jpg?r=e79', 'https://occ-0-1391-778.1.nflxso.net/dnm/api/v6/tx1O544a9T7n8Z_G12qaboulQQE/AAAABeW7c1hWQBC_DUCrWrfN9H1lWGe2_T2SDLnqsNi6r9iOq7f1Bx2RK-FO31IZwCT63gh86EoW1ztBvsfBqdyVUnJBUy1EJNOMjpY.webp?r=93f'),
(15, 'Prison Break', 'https://occ-0-1391-778.1.nflxso.net/dnm/api/v6/X194eJsgWBDE2aQbaNdmCXGUP-Y/AAAABcZ25VrV_k9_WIdbmm5kLJRlPwQxjvLynJfBe5gUizv0Z2SfQesZ9wy_k58uxehn1vWZXhXaxC1szfaUduLwMUOw3RM.webp?r=f8f', 'https://occ-0-1391-778.1.nflxso.net/dnm/api/v6/tx1O544a9T7n8Z_G12qaboulQQE/AAAABdgG0qpA9SPIKgyljgl7aGGaQe4nA-MpjZbXj-5RrVouiKJaVaM0JIOYNMBt8nVb81jF6wP7aSznydZSNjMxL6Ou9dwE2drcZZY.webp?r=b89'),
(16, 'Narcos', 'https://occ-0-1391-778.1.nflxso.net/dnm/api/v6/X194eJsgWBDE2aQbaNdmCXGUP-Y/AAAABWLU_wxBJ9xYKXWQIniWglZNoxM_UC39ySB29jHszoEg6Q4Ft8dLo4pe8xPx8Z_y8NPWZzfFJXz0MDAx6CDQAnQRXjNwnnZ9-ml1pVdCWK6oqaMSnqcCokN7Hfg4.jpg?r=578', 'https://occ-0-1391-778.1.nflxso.net/dnm/api/v6/tx1O544a9T7n8Z_G12qaboulQQE/AAAABTgcY9doS2612y_opmKf2NR05ocm56XWru8DqUva2UQpwPidTYEQ7G1KeGnz9E9eQ5DyNJMtDuMjSZ-kaUKQ_srhVmkNRWZ0COdTpFd7_Z1ge61B8qX8AFZYDiw5Rts4759r0FyM_RJg4IJYdj9_OWTOM83OIUtQ_by5cIXP9aCT.webp?r=de0'),
(17, 'Peaky Blinders', 'https://occ-0-1391-778.1.nflxso.net/dnm/api/v6/X194eJsgWBDE2aQbaNdmCXGUP-Y/AAAABXT391fyWcNnuTye4DU3tGFPpF62YQ6AoQqS3j7O5tKJouRRE8IiV6s2-olTDmt_hzMi8Zz8CAXbteUgu5R77AkxZsZDu80NtFzqNmtR63MdkHUQE7N7NiJN6TO6.jpg?r=680', 'https://occ-0-1391-778.1.nflxso.net/dnm/api/v6/tx1O544a9T7n8Z_G12qaboulQQE/AAAABcgq5tyQQ-MYQF_ZGuJR7EptZ6dE3zHP2rl4CWPc3_7Z6kRPHDaicpEJ5dLjxmrEXhOOofYWPUKtT3ouE4f-KLNMiMvZDmKpxSGL9_8VWNxxWwNCHNenZEzT8QRfZKOrLAhGzTFO-M4FKFdIqG2C40AlWtsCYGaesPWCIJxB34td.webp?r=d45'),
(18, 'Money Heist', 'https://occ-0-1391-778.1.nflxso.net/dnm/api/v6/X194eJsgWBDE2aQbaNdmCXGUP-Y/AAAABcQxdPFG90ttQZ-WSFAaR2nBeQnqpcF5GUYeV2KKS-0NMYSV-AIptWZG3S_BX7MDcuuIkW-8v2SintCM4wLRMu9j3G2etGVQ0iZYAyNgkE2n7JI5pqroDOyfG6Oa.jpg?r=a0a', 'https://occ-0-1391-778.1.nflxso.net/dnm/api/v6/tx1O544a9T7n8Z_G12qaboulQQE/AAAABXvH0T1WSL5DTOEz_QMuPijRAbxdwSo7_uMXUhW_lSKUGNIVZOgNfomSthYOhQ5NE7MhgI6pMVPmcS1-PoJYf_MLV98feoWykW-VFy1lGGEJVUHeoWQrFDbNc_-2GZegrAyUKLOOrWTeXHRvIJ8UIcssNUcFtLTXZSajS6QeNtcQ.webp?r=dc7'),
(19, 'The Witcher', 'https://occ-0-1391-778.1.nflxso.net/dnm/api/v6/X194eJsgWBDE2aQbaNdmCXGUP-Y/AAAABelflbF7hLllQWMP9vusyHxWklYqi-_xMHvad3rT2_mVkUWZoD_C1iDbNUCeeZ92dfng-rikd9HvJIUvZZ3oo32fhhKlwEdPt1CyR3cT7occykhrEeKHaHJglR78.jpg?r=382', 'https://occ-0-1391-778.1.nflxso.net/dnm/api/v6/tx1O544a9T7n8Z_G12qaboulQQE/AAAABcB11UzFYG1CKGHDQo4eIk-GE5hjKRVDs2yukXnq7JAHEK1Zd-gCLQUd707FlGh5vuAkcgJaj2pkmjjh03V9oN1NqmHk3RYJMSog24DImMUUAgBQZjjcICzVJ10xyAYF6u-O66AkMpT1O_vszYr08R63RRMbU1KJlydIgCXQSMv2.webp?r=43f'),
(20, 'Sherlock', 'https://occ-0-1391-778.1.nflxso.net/dnm/api/v6/X194eJsgWBDE2aQbaNdmCXGUP-Y/AAAABfKRRMPmoZYowzj2Sy0JavqXoWjs3_oJDPf9G4HKbNoZ8b1YgbwF0bO0kV-iLqonegh2EY6U_tkGt_isPz3WAQ3r8Uk.webp?r=5fd', 'https://occ-0-1391-778.1.nflxso.net/dnm/api/v6/tx1O544a9T7n8Z_G12qaboulQQE/AAAABbMw1QvGVojAhoTwnbooe8PHdzGYlFYAAprkmZK2LbJDkuDjl09Ig1V1ThvtNuCYT-4pYiagVTYiTTh_rsbW4xMgkMTqPUPGFO8.webp?r=938'),
(21, 'Black Mirror', 'https://occ-0-1391-778.1.nflxso.net/dnm/api/v6/X194eJsgWBDE2aQbaNdmCXGUP-Y/AAAABekxLJhbF3PWdorhGW-HWIBxgKOErrMXH6hEgyxzbtLGLhRBO9KdWcvUXc4SXlBcSFrPG5kHxFKCePW_bHHCYRb_q2Cza9hpIRPf34SjEXc2C3_uF0slUK0unBxR.webp?r=bfd', 'https://occ-0-1391-778.1.nflxso.net/dnm/api/v6/tx1O544a9T7n8Z_G12qaboulQQE/AAAABSmU1Xp1Cqwn2BBfwGZlfF-AGAXdyI8r-lMCWYgS219-cfEITwdPjGvM9KsWohSAWWsWeYD3AQbZ7wVgtkddm-z7xrQEP5dphhwWQObglvcm2yptYZPU_CVgTFbZpzIxkjKNVwjfeLRuJVhGoDg_rmNeOtUM4Ol98MTTJWKuhGb2.webp?r=76f'),
(22, 'Vikings', 'https://occ-0-1391-778.1.nflxso.net/dnm/api/v6/X194eJsgWBDE2aQbaNdmCXGUP-Y/AAAABYVZbqz_uitE0A1OmhKLo3WWuKlxVcPkV9Iaa2jtC-3OBvD1S8h27ov27K2A5e1Gvpt8TYTMPIroq_UtCn28Ho8rIxg.webp?r=eab', 'https://occ-0-1391-778.1.nflxso.net/dnm/api/v6/tx1O544a9T7n8Z_G12qaboulQQE/AAAABfkgjGOWUEYkqRTg0ekQkAq3o00-Ad9jgunnZ3Xb3q9lDQcGy_hmkCp51w7Kok8ePDGvpnWIxl6rJuSW73sO8QBJAWtiUrTkOtM.webp?r=4ae'),
(23, 'Fargo', 'https://occ-0-1391-778.1.nflxso.net/dnm/api/v6/X194eJsgWBDE2aQbaNdmCXGUP-Y/AAAABTtZja_vYthSMphLnEUpOzxcpgzmKKqKAEMsK5AI7InB12uD4lptWy-DCH7OH3VueWZ_kCAtZdPMv-Ddy2P-ie4WLGI.webp?r=76f', 'https://occ-0-1391-778.1.nflxso.net/dnm/api/v6/tx1O544a9T7n8Z_G12qaboulQQE/AAAABfJes25eF3vL9NNtn8XZp4SfI15aYZ7kqYP3Yj_AgM8o7mhcpxDDC8GIX6NnLVKEg0CAH0pcm79TjO6bNgNUiS-ZT19CXlZ5470.webp?r=ecb'),
(24, 'Sons of Anarchy', 'https://occ-0-1391-778.1.nflxso.net/dnm/api/v6/X194eJsgWBDE2aQbaNdmCXGUP-Y/AAAABV6MVS2EAc_svTNTNPDi-gd0GO6vd7u84MAUNov1GrdlPUYwklW6UBotpvjAjfVaR2JjDbTMeFDMlfna7WV-jxTqzAE.webp?r=e9b', 'https://occ-0-1391-778.1.nflxso.net/dnm/api/v6/tx1O544a9T7n8Z_G12qaboulQQE/AAAABTfvlXuYMEKFRUPx4a5SjB6of-3upoR5rBoJafI2lcviSMBS5INHfIVWcQWnR4gsUpWx-ddXYOCAG_yHyT9Hw1lsoalYEYP8ysg.webp?r=616'),
(25, 'Gotham', 'https://occ-0-1391-778.1.nflxso.net/dnm/api/v6/X194eJsgWBDE2aQbaNdmCXGUP-Y/AAAABdVYJdTy8SGkfAC2jMyXvv3A7ihOKDWmcg0F9OQ-kRh-rnCzZxLpW3RXYqHuXXolcsTDHUQTsZ78fIkG1D1KGnoJh6U.jpg?r=282', 'https://occ-0-1391-778.1.nflxso.net/dnm/api/v6/tx1O544a9T7n8Z_G12qaboulQQE/AAAABdTAOtn3R2rp-dkLA7Xc0k89r12RgEyzdEGHnWAl53_Ex9gsprpkOrg8cDuy8Zn152QkHYHTfXpMacJ0ijNEg8YSFNbzhWx2D58.webp?r=80d'),
(26, 'How to Get Away with Murder', 'https://occ-0-1391-778.1.nflxso.net/dnm/api/v6/X194eJsgWBDE2aQbaNdmCXGUP-Y/AAAABTR_rdYPXLd-bG_aIDyTXOATk1L4dUQlraRT2v4zURl3Drwyy4GT-FIuDL4LYrMrFMS5Vfpa1EES8Z2lKYN8EId5rSY.jpg?r=e0a', 'https://occ-0-1391-778.1.nflxso.net/dnm/api/v6/tx1O544a9T7n8Z_G12qaboulQQE/AAAABXVYUlRQ4Z24keRJxKxNzxnRa4SSyekQbD9R8jAtgtGFjJgJbxTcL5MrLfk4CEVPX4bE_WSTO-lDRJmuV-ESrk0uhXZL078TRPI.webp?r=6af'),
(27, 'Limitless', 'https://occ-0-1391-778.1.nflxso.net/dnm/api/v6/X194eJsgWBDE2aQbaNdmCXGUP-Y/AAAABdLa-W4kx2xH4Nv50N45bx8IvpPRPmepB-N6IZ-XR3q5t60-nCuSGpXSD85BFSbHsno0EmWU5Teqp7pybU4DtUVs0hw.webp?r=235', 'https://occ-0-1391-778.1.nflxso.net/dnm/api/v6/tx1O544a9T7n8Z_G12qaboulQQE/AAAABVt76ewvmmBDmTub3BI6siiDQyvfvftpYKUSHknfc0Lp1VbC9vfae0SQQibFI85bjO-_W4R_glrOBQUdtj5_c_GerEemo_l7QwI.webp?r=856'),
(28, 'Altered Carbon', 'https://occ-0-1391-778.1.nflxso.net/dnm/api/v6/X194eJsgWBDE2aQbaNdmCXGUP-Y/AAAABa6MswfSIfB0tDYvLUa3eQwIzHDWwDqNqOTN9xAHoMuRm3MKFNW71mFTYRnogi1-nnXZ0COl9GngBWJQLAhEh03HvBpvoUzxx4dsUvrdM196o5M_t9G4r4tIB1UN.jpg?r=525', 'https://occ-0-1391-778.1.nflxso.net/dnm/api/v6/tx1O544a9T7n8Z_G12qaboulQQE/AAAABXmA8TczMKDlffq_2iSP7_magLkS0TCBixAuZGIBuLXToNR_oK5ddYF0e30d-xzWL-GH7YqwXrNd2QO35muVvs2-A6Dtkxcg4rv5jOE_p676XEB_KmNveMLPfK96Q2BnUl04rgFCWsRLqBv7_r8dg13BfwVZwLuSJ0_N6D5VUJRF.webp?r=f62'),
(29, 'Teen Wolf', 'https://occ-0-1391-778.1.nflxso.net/dnm/api/v6/X194eJsgWBDE2aQbaNdmCXGUP-Y/AAAABT8li2qXjS8zn12ERSI33sVgv0v1iwQEzfwB28xuyWh8sm1iHt_JRyrrha11ZY6J5hDo6A47J7thZAWrNAQ3Tb3rBEo.jpg?r=d78', 'https://occ-0-1391-778.1.nflxso.net/dnm/api/v6/tx1O544a9T7n8Z_G12qaboulQQE/AAAABfqK8iLGP-Bnv2l9LmKmphaKDwP3GW4w4ZiFIRgCJ19jvwBGBZz1CBsPYF_9Tt1dGkwdqD-fK78x5RgJb-kUH0ADLm170EibJmw.webp?r=72b'),
(30, 'The Umbrella Academy', 'https://occ-0-1391-778.1.nflxso.net/dnm/api/v6/X194eJsgWBDE2aQbaNdmCXGUP-Y/AAAABVp2asRLMqBDtgNX3bwzallgbvVwPg5d8BWUMuJjnesDoy8BJjjcirT4IRdWrCopjNdbNpCPdUE0OJgqe6x5va-SB5rn9rDEYtFtFCMg1hLGNmIJ7oszYvXw-opz.jpg?r=9a7', 'https://occ-0-1391-778.1.nflxso.net/dnm/api/v6/tx1O544a9T7n8Z_G12qaboulQQE/AAAABUnyJrP1DxGnpFhS1bYIVWMHAHGk1IWIdsS7Wd0obi2W91fKbbaXxtGhs_3ztC9IBdkgA3RvUOozuBMNnXp_3QN0Mc5FOup1eyS0zLYpBlAUOHYZDLfiFGKF-gLRvPEtqtx3aoSlK-nzLlP9Mjww8x-xlezMY4Q9ECvcH4xjTM_x.webp?r=e7d'),
(31, 'Daredevil', 'https://occ-0-1391-778.1.nflxso.net/dnm/api/v6/X194eJsgWBDE2aQbaNdmCXGUP-Y/AAAABSaCl59yo8cED0edHkHcRryQLc23XTU7ON6hVdO1GIkFm0LFy22cLtvC2R6__k3P5E7qmA_vYhCXr_ls1sw5a_-fFH3iuS1u88Lqto3BQwsgzabS2Kegri7SuDRv.jpg?r=80f', 'https://occ-0-1391-778.1.nflxso.net/dnm/api/v6/tx1O544a9T7n8Z_G12qaboulQQE/AAAABXctH3t5py8G-wuYy0wM31pAKc6pqaNHo80usDcNlQmLLvdRtBNyUWiPlfe7Co-3Au27K-V12y1qh6EuJ-4B0Pakx3rotBgo0RplbNWSOrvUj5X_NYJBvVYp0qKknIwRaz1wVik1f3edL1pB8x5Xg275B7ysKk4uPAlVidJ61821.webp?r=3c5'),
(32, 'Titans', 'https://occ-0-1391-778.1.nflxso.net/dnm/api/v6/X194eJsgWBDE2aQbaNdmCXGUP-Y/AAAABVfnPWceVnLkzpuJFb3_o4UH3SncPQyjVOVyQGBuVEUy28i_maxDDudFq-2sZL9HmOR3_Yb2UL02LFLQzKvMJTsad_fTUtwUtMgf7itQ9f06UPieOpeco80pDDo4.jpg?r=84f', 'https://occ-0-1391-778.1.nflxso.net/dnm/api/v6/tx1O544a9T7n8Z_G12qaboulQQE/AAAABa3oxYJEtlJE4O0T-pn7s_ixP8bc8h-uho3nuHDyUfYu-gwagqF3gd0jYxVzY18g3yGkkS6ZB4rFlMRAPXoCPjw_gx7oRKf3LlojWi1NKk87EaaJ31iNniAamoL_N_aEJ8m0DJkUySKx8u5t4zHOSNDUc7wjWaK-7tAYFGwMB6C-.webp?r=999'),
(33, 'Dark', 'https://occ-0-1391-778.1.nflxso.net/dnm/api/v6/X194eJsgWBDE2aQbaNdmCXGUP-Y/AAAABTpCR8YGDediYhXcOIuU0xcSVxnsyvXv7LZztq4sB8QeN0IJLwz400Co4sjB_VhYoziLgjRUfBZC2RXR7KKdoeIcI7P2-P5M_wyOgUwMFBrVHHTNyntGPdh3Sreg.jpg?r=a13', 'https://occ-0-1391-778.1.nflxso.net/dnm/api/v6/tx1O544a9T7n8Z_G12qaboulQQE/AAAABeHTto3lTh7DmTcR4Z-g9LI85c5KjWLASePg9n2MtZjBddJRzdJsQgN77GD8TQGl6mUm-UP8KLxeasZmSqWJPdMQOzgaEPNpJSbnxybSXmVm9RqcvL66NAc_pt5XosTg4aMQOpc3RT-KbwS3oRcQCOOBmbGbcXBMxzBLwDaIepTA.webp?r=50f'),
(34, 'Our Planet', 'https://occ-0-1391-778.1.nflxso.net/dnm/api/v6/X194eJsgWBDE2aQbaNdmCXGUP-Y/AAAABf8i7tP1EVWxOD1n1wLWe938uAn1FAXdJJJVJxc8QR9WObZ8QDSgCjX3-qtuaN8q-K1ukJqL_Rxp9ln67ofKbWohpycsEbRPHxexXXhsA3MwS-_We4uNfrPoKJY2.jpg?r=df4', 'https://occ-0-1391-778.1.nflxso.net/dnm/api/v6/tx1O544a9T7n8Z_G12qaboulQQE/AAAABfej-BCPy9Rh6CMr3qXyN2lolWFbPG9FMiazVnuZXURpab_0JCEOQMdv6cVI_Tb1s0zvd_RraO2KMhDwCwgs1suVrnVcrgUtJUX_rtIYypdNZkvjEc426zJBxdRWLi1ii25Jg8Nqn-ZG2W4UmR3E1PwQESruyNcvBqHySHfG1y7a.webp?r=31a'),
(35, 'Disenchantment ', 'https://occ-0-1391-778.1.nflxso.net/dnm/api/v6/X194eJsgWBDE2aQbaNdmCXGUP-Y/AAAABQpAuCa_4jfJmtiASc6EHn3vmMYFg-rQJ6iX6i_dw5UuOr8kpPji8p1JGdfigQXGe925DhNx48dgqTnckldiU6TMSNLwiCVmpJoD5zB0D3zx9dtypvHoEvCWOE07.jpg?r=9a4', 'https://occ-0-1391-778.1.nflxso.net/dnm/api/v6/tx1O544a9T7n8Z_G12qaboulQQE/AAAABXwj_Ds7NPU9XnF7h2UrzrCK4DwaXJdwLNGomkK4tH0azGxwHY6xqa1Hft5wQfXK5ULMvjvEeJW8y_hFJlyr4Kndmf0h-cYvvNzOdATQLp0TOyE0oLXLEJr696GIWpNsYFdXm5Way7yY9xxffIJpzRW5QM0eHIR34Hp51Q7BBRmJ.webp?r=39f'),
(36, 'Paradise PD', 'https://occ-0-1391-778.1.nflxso.net/dnm/api/v6/X194eJsgWBDE2aQbaNdmCXGUP-Y/AAAABcohRaSbGpLnF4aE4McQ4wNlBOKJKxOjWffRtLpTawR1LZxjfIvqmV7d8_O7-fcRo_Hi8EcIVFVdGARrasvLzuMjJWp3BXN5oE3JwQYARCqTxQ9nyxlneZrQOoqB.jpg?r=ef7', 'https://occ-0-1391-778.1.nflxso.net/dnm/api/v6/tx1O544a9T7n8Z_G12qaboulQQE/AAAABUO7BbHEl2SgEeGQOFIUJZWDZdc8G4JeGKke7MiyawS7sbD6oT94CU3oT97bUQgrFsf5YA7eG45eHI458byiyML0k73MBPLR7ivedNIf1BshRlwfuSlr1cvAoujIpeVWID6OaQV-fVGb6aFgZKxrvLN2CMiVFOdZ3c4k85h8_Jsz.webp?r=1a7'),
(37, 'The Crown', 'https://occ-0-1391-778.1.nflxso.net/dnm/api/v6/X194eJsgWBDE2aQbaNdmCXGUP-Y/AAAABZiKFJXWPo7Scj8oOPgjLtbf5eO6QYiw2i4khPfDk1hwYPVXRUS9JQIngXhbDFY4o1x6eZXL4PpNcachR_lbYaS4gNmvN0CeFs6wmp9149kr_08HNptJUcych6iy.webp?r=4ef', 'https://occ-0-1391-778.1.nflxso.net/dnm/api/v6/tx1O544a9T7n8Z_G12qaboulQQE/AAAABct-MOWlkKYeR8w4eq7FLu3RisdoSSAOsCCjBXJ0YgqRyuai7EFo02JyCn7WlIY2jvs0tZZENAeJpuh5q8HCm_kZks2JzIBah4InFgF9CooCNAYUn5BTkRJhHPU-MVxjUTb_ZHK7NP04fopeYGYS_EtbOw2-MlU5dTQCdE6S1K1p.webp?r=b25'),
(38, 'Inception', 'https://occ-0-1391-778.1.nflxso.net/dnm/api/v6/X194eJsgWBDE2aQbaNdmCXGUP-Y/AAAABVLuOhe_nQy5456v750ImC2pv5cft_LYLbX1YZ7UAQZfwb1NI4fRnPyZyj3HEbl5TDTlAJwt4e49u3IghYtIDeCHEOo.webp?r=c15', 'https://occ-0-1391-778.1.nflxso.net/dnm/api/v6/tx1O544a9T7n8Z_G12qaboulQQE/AAAABSfHL5aFCPa5-J_HiLn4elONYPMesDMdp1JreFu3-SeoJdZ3-gRIOv9sQFPNB6EI-fAXl6NkgfUx5rXpn2iNzOAxrAzHBMu-7WU.webp?r=9b8'),
(39, 'The Shining', 'https://occ-0-1391-778.1.nflxso.net/dnm/api/v6/X194eJsgWBDE2aQbaNdmCXGUP-Y/AAAABeE1Ga7le7Gugf6ILHYbge8dvNuvI4ek-pKEnSgU7DrwLW1KLrlCj9fBXmiMjrzylmVYsJ4o-eUw5WbgHXL7WTbwxDQ.webp?r=4c3', 'https://occ-0-1391-778.1.nflxso.net/dnm/api/v6/tx1O544a9T7n8Z_G12qaboulQQE/AAAABa1H3HU6qGAuqUcjoPL6wol75eGBzwMLiR0KHTDRCinMUv_9zxtqAxb-ZKmZoU4V7s5atxZDl811EMRq6f5ahJycnZ_aHpxgz3E.webp?r=a42'),
(40, 'Venom', 'https://occ-0-1391-778.1.nflxso.net/dnm/api/v6/X194eJsgWBDE2aQbaNdmCXGUP-Y/AAAABawkZ04yQYIxBWLUVuE7nk6517CpIYAk_yZJvK3HsimkNFapwyoFPRDfK3WacNL4gxw9HZivSH7RcFXRojOLaONVJ892clUzXlXSOck_Ci5OlFuZtnGZLHARcKqTSFXNx4tT7HAoiBKhTMrHvxWeQoTVrbo.jpg?r=93b', 'https://occ-0-1391-778.1.nflxso.net/dnm/api/v6/tx1O544a9T7n8Z_G12qaboulQQE/AAAABWIzyfeVo1klpHI-18mcNXtaydIqHOUwG17ItUW2x-oSGgwqqGR_Wa4DXG8N5pUX0Ad0a7OjwHm5uw2TuyCYh3F2GVoaJThfrAw.webp?r=2ae'),
(41, 'Jumanji', 'https://occ-0-1391-778.1.nflxso.net/dnm/api/v6/X194eJsgWBDE2aQbaNdmCXGUP-Y/AAAABW0lXoLK9RHvZCzOMfznYxuxxL39BfYgE9Rz-ZZbVB8J7JJiQosNap-fh39y9q000218LD1knZwOhpnX1179FhdBKns.webp?r=13f', 'https://occ-0-1391-778.1.nflxso.net/dnm/api/v6/tx1O544a9T7n8Z_G12qaboulQQE/AAAABUG3fJhz3ZoidVh8YLnuZmaRCejnuM4rMvpLKeb0F3wCKCqgW4A5rRPDAQ5xML9nJmMpzimgz8yx-InR6Gy4M2-sFgK8I0V-ilk.webp?r=5d0'),
(42, 'Spiderman: Into The Spider-Verse', 'https://occ-0-1391-778.1.nflxso.net/dnm/api/v6/X194eJsgWBDE2aQbaNdmCXGUP-Y/AAAABUDrdxhAk-_-kMxpvcDGCDNl4sEsaipyCui9qsynOXo5zqhMjgn0J-miZTLs0bIWvOPbY0lg2NMGBoa6OsEoCeTX6sA.jpg?r=cd8', 'https://occ-0-1391-778.1.nflxso.net/dnm/api/v6/tx1O544a9T7n8Z_G12qaboulQQE/AAAABSSTIAQvaCWbcDwgZffWRi9YHiMYSqEjzNiCMPiWa1uVQw8ITVRmEmcYxo6ZfMEuuDmboXyPa0gyeDOVMVlZm17gEJYGgkqJOZ8.webp?r=71a'),
(43, 'Ride Along', 'https://occ-0-1391-778.1.nflxso.net/dnm/api/v6/X194eJsgWBDE2aQbaNdmCXGUP-Y/AAAABREb57mxE0qzlixgas8xoNtnn0FxLz1OxGAIsfwvabRoOgFTZaLqWCLzZAwUehPuOaSARP9SW3fB667Ap5_ar3wbwnE.jpg?r=2d1', 'https://occ-0-1391-778.1.nflxso.net/dnm/api/v6/tx1O544a9T7n8Z_G12qaboulQQE/AAAABSx2G_xX7SDu-F4ccpm8GbCx5uodip1Fl0-P7lgSrHm7qffT5Oe-2nByYDawzjxR4QA-YvtGkFJV_1kSMMXbDBOrYKtaG0XTmI8.webp?r=63c'),
(44, 'Rush Hour', 'https://occ-0-1391-778.1.nflxso.net/dnm/api/v6/X194eJsgWBDE2aQbaNdmCXGUP-Y/AAAABZ9wtw2T7b4Lifg9PJqhUDF-MlHhRzhewj3Fn6F9CDKrvIzsWh2Dk4_ILCmWAR6ws9uMNhaGujq704H8x3DZHcZM5L4.webp?r=258', 'https://occ-0-1391-778.1.nflxso.net/dnm/api/v6/tx1O544a9T7n8Z_G12qaboulQQE/AAAABWS__DmKGyfSgguslKP5sJr7eGN37Y0DZIsK4Mlk_54BmSq2wqCBtLBGDZzdzBCEflGteURhGk88T4_GkQEWmLaMD4ix5DdE5M8.webp?r=f75'),
(45, 'Matrix', 'https://occ-0-1391-778.1.nflxso.net/dnm/api/v6/X194eJsgWBDE2aQbaNdmCXGUP-Y/AAAABdB-agTGlNf4oxM742brFKpbkag-S61sRX_zDgH8BDoEkF1Lh3cIVuBp_mXW0BKmmMAKrKqvaVJsF9uQ3C3eX3Sb1-o.webp?r=5a3', 'https://occ-0-1391-778.1.nflxso.net/dnm/api/v6/tx1O544a9T7n8Z_G12qaboulQQE/AAAABep0NjoVU9WhGEoaHUM4_eSWSKYIe875G1ryVR7pxjtPyaK4zzIJken8NLLogOQ_QRok9T11TRfUwqcHOzMIrERLKZj__ibqqzM.webp?r=432'),
(46, 'A Million Ways To Die In The West', 'https://occ-0-1391-778.1.nflxso.net/dnm/api/v6/X194eJsgWBDE2aQbaNdmCXGUP-Y/AAAABfOcF_dK7oxrVgcekMJrQR9FvRJ5MaEaWxRtlBE54aOuGKNLKZXRm7oy84qta8B6P7NTaC973N7JTOU7y-RRu_CqMSg.webp?r=488', 'https://occ-0-1391-778.1.nflxso.net/dnm/api/v6/tx1O544a9T7n8Z_G12qaboulQQE/AAAABf-1TxrtAaZTvpBW_N6PpfnjyYGgzAJZ4DrVB5RY7ry_f3tCa9TL6jjUOOLlQvv_pLPnjGGQjcs9azOnAcXW3n2HPaYA4fHOIYY.webp?r=7f1'),
(47, 'We\'re The Millers', 'https://occ-0-1391-778.1.nflxso.net/dnm/api/v6/X194eJsgWBDE2aQbaNdmCXGUP-Y/AAAABYoAJp_3trolrM85mBNLjyXWMaDf7rcnszq50wZMU4Swh5TYVKn8mtBispeg6zsJnqpO0cxi_VhNJAcYs4aMntmnGVw.webp?r=ae5', 'https://occ-0-1391-778.1.nflxso.net/dnm/api/v6/tx1O544a9T7n8Z_G12qaboulQQE/AAAABQE9T1GGwNjpqwVZJ_T4P_C1_zqTSTmpq-aibSvyxV5eraUFZphFYArnbvZYZZCUmSgWg053ar8K83dpW90gtSegqJnzsip37wU.webp?r=5c1'),
(48, 'Murder Mystery', 'https://occ-0-1391-778.1.nflxso.net/dnm/api/v6/X194eJsgWBDE2aQbaNdmCXGUP-Y/AAAABWnjkw001PhAXs9LPze1q7qtdWLnZO1eej7tgwMV7Bx3dD38CVKhyJftd7Pd97RaP5hMqKyIrd1FIcvTNuriZ334qrgu0nJc0uI8KYsEgpJhoHCI0QFTYDc4z4o7.webp?r=f98', 'https://occ-0-1391-778.1.nflxso.net/dnm/api/v6/tx1O544a9T7n8Z_G12qaboulQQE/AAAABZ0WmTnR5kBL2jceaOIrU40uhN92OC00fLEsvRhziQzvvpXa9PbZAN6aLqEaddoBjA8qWHAbGApcCXa1dQXb7pxpRWshadAZWTXJbzl5heIk-xrPGQnAPZ_8Iw2VwWnhwxmGsD79WFhNauOhDfPK_y8Ec7YaAcHt1kj8cL54QknN.webp?r=e1d'),
(49, 'Zombieland', 'https://occ-0-1391-778.1.nflxso.net/dnm/api/v6/X194eJsgWBDE2aQbaNdmCXGUP-Y/AAAABZtkXesfC2oVDzHrM9lGCuUKXXAzBZKwh8R-SKcK9HynZJMOuUQ7aPOyh3Cprzm3oAfQ3RX0TdDVNvomB04XRZY6zMA.jpg?r=e73', 'https://occ-0-1391-778.1.nflxso.net/dnm/api/v6/tx1O544a9T7n8Z_G12qaboulQQE/AAAABYiPTTs4IAoBICnQe1D0c1P0dNfDQ-lpo0-JZUbyWMt_EQD3UBCnNFr7VkJ5aNnvSVgfaL0dRzIUgYWtqzJqjUiIsNnyHv0wD7c.webp?r=498'),
(50, 'World War Z', 'https://occ-0-1391-778.1.nflxso.net/dnm/api/v6/X194eJsgWBDE2aQbaNdmCXGUP-Y/AAAABUuTaYcJTifyci0TqViHggIL-frpPPDePwyBaN6uC_AUzOExOyotIPDFbjUb1FOjgUI7rASbir95xtT896CHvP6zqpg.jpg?r=4b7', 'https://occ-0-1391-778.1.nflxso.net/dnm/api/v6/tx1O544a9T7n8Z_G12qaboulQQE/AAAABWWl2haoV3H9mj4POkBvQDp5KK0a_Y_zsESbapuWvWRG1HWs7XmsR5MvmuvYx0dMR6bGaVtv3X8GhdFXiCNSS4KpNKEme2wjOK0.webp?r=4d8'),
(51, 'Lucy', 'https://occ-0-1391-778.1.nflxso.net/dnm/api/v6/X194eJsgWBDE2aQbaNdmCXGUP-Y/AAAABcmfLdBeIYZV9sgmBwK-FILKOEdKeVn5XivHWaAdeXuvO7c5dMtw7lStjRHH5tPjNsxcwVcEjDaWiY_b6Nyt4NMeDis.webp?r=dbf', 'https://occ-0-1391-778.1.nflxso.net/dnm/api/v6/tx1O544a9T7n8Z_G12qaboulQQE/AAAABfbTC2jChiEuFrPs2p3ogRBHiZbnG5DmWRxRWQHiUSU4ndL2s2FbBcjIyd65j-rcBgb9NpCitVFZwAhE9LcISn1WPlmPsMOIzdw.webp?r=519');

-- --------------------------------------------------------

--
-- מבנה טבלה עבור טבלה `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `gender` varchar(6) NOT NULL,
  `avatar` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Indexes for dumped tables
--

--
-- אינדקסים לטבלה `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`);

--
-- אינדקסים לטבלה `shows_and_movies`
--
ALTER TABLE `shows_and_movies`
  ADD PRIMARY KEY (`id`);

--
-- אינדקסים לטבלה `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `shows_and_movies`
--
ALTER TABLE `shows_and_movies`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=55;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
