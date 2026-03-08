<!DOCTYPE html>
<html lang="id">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Buat Password Baru — Masterpiece Signature Karaoke</title>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link href="https://fonts.googleapis.com/css2?family=Bebas+Neue&family=Outfit:wght@300;400;500&display=swap" rel="stylesheet">
    <style>
        *, *::before, *::after { box-sizing:border-box; margin:0; padding:0; }
        :root {
            --bg:#080810; --bg-card:#0F0F1E;
            --neon-pink:#FF2D78; --neon-purp:#9B30FF;
            --text:#F0EEF8; --text-dim:#7B78A0; --text-muted:#2E2C45;
            --border:rgba(155,48,255,0.2);
            --ff-display:'Bebas Neue',sans-serif;
            --ff-body:'Outfit',sans-serif;
        }
        html,body { height:100%; background:var(--bg); font-family:var(--ff-body); font-weight:300; color:var(--text); }

        .bg-wrap { position:fixed; inset:0; z-index:0; }
        .bg-orb { position:absolute; border-radius:50%; filter:blur(100px); animation:drift 10s ease-in-out infinite alternate; }
        .bg-orb-1 { width:600px;height:600px;background:rgba(155,48,255,0.10);top:-200px;left:-150px; }
        .bg-orb-2 { width:400px;height:400px;background:rgba(255,45,120,0.08);bottom:-100px;right:-100px;animation-delay:-5s; }
        @keyframes drift { from{transform:translate(0,0) scale(1);} to{transform:translate(40px,30px) scale(1.1);} }
        .bg-grid {
            position:fixed; inset:0; z-index:0;
            background-image:linear-gradient(rgba(155,48,255,0.035) 1px,transparent 1px),linear-gradient(90deg,rgba(155,48,255,0.035) 1px,transparent 1px);
            background-size:50px 50px;
        }

        .page { position:relative; z-index:1; min-height:100vh; display:flex; align-items:center; justify-content:center; padding:2rem; }

        .card {
            width:100%; max-width:460px;
            background:rgba(15,15,30,0.85);
            border:1px solid var(--border);
            padding:3rem 2.5rem;
            backdrop-filter:blur(20px);
            animation:fadeUp .8s ease both;
            position:relative; overflow:hidden;
        }
        .card::before {
            content:''; position:absolute; top:0; left:0; right:0; height:2px;
            background:linear-gradient(90deg, transparent, var(--neon-pink), var(--neon-purp), transparent);
        }
        @keyframes fadeUp { from{opacity:0;transform:translateY(30px);} to{opacity:1;transform:translateY(0);} }

        .card-logo { display:block; max-width:180px; margin:0 auto 2rem; filter:drop-shadow(0 0 20px rgba(255,45,120,0.2)); }

        .eyebrow {
            font-size:.62rem; letter-spacing:.38em; text-transform:uppercase;
            color:var(--neon-pink); text-align:center; margin-bottom:.5rem;
            display:flex; align-items:center; gap:.75rem;
        }
        .eyebrow::before,.eyebrow::after { content:''; flex:1; height:1px; background:linear-gradient(to right,transparent,rgba(255,45,120,0.3)); }
        .eyebrow::after { background:linear-gradient(to left,transparent,rgba(255,45,120,0.3)); }

        .card-title { font-family:var(--ff-display); font-size:2.2rem; letter-spacing:.08em; color:var(--text); text-align:center; line-height:1; margin-bottom:.5rem; }
        .card-title span { color:var(--neon-pink); }
        .card-desc { font-size:.78rem; color:var(--text-muted); text-align:center; margin-bottom:2rem; line-height:1.6; }

        .field { margin-bottom:1.25rem; }
        .field label { display:block; font-size:.62rem; letter-spacing:.25em; text-transform:uppercase; color:var(--text-dim); margin-bottom:.5rem; }
        .field-inner { position:relative; display:flex; align-items:center; }
        .field-icon { position:absolute; left:1rem; font-size:.9rem; opacity:.4; pointer-events:none; }

        /* Toggle password visibility button */
        .toggle-pw {
            position:absolute; right:1rem;
            background:none; border:none; cursor:pointer;
            font-size:.8rem; color:var(--text-muted);
            transition:color .2s; padding:.25rem;
        }
        .toggle-pw:hover { color:var(--text); }

        .field input {
            width:100%; padding:.85rem 2.75rem .85rem 2.75rem;
            background:rgba(15,15,30,0.8);
            border:1px solid rgba(155,48,255,0.2);
            color:var(--text); font-family:var(--ff-body); font-size:.875rem;
            outline:none; transition:border .25s, box-shadow .25s;
        }
        .field input::placeholder { color:var(--text-muted); }
        .field input:focus { border-color:rgba(155,48,255,0.6); box-shadow:0 0 0 3px rgba(155,48,255,0.08); }

        /* Password strength bar */
        .pw-strength { margin-top:.5rem; }
        .pw-strength-bar {
            height:3px; background:rgba(255,255,255,0.06);
            margin-bottom:.3rem; overflow:hidden;
        }
        .pw-strength-fill {
            height:100%; width:0; transition:width .3s, background .3s;
        }
        .pw-strength-label { font-size:.6rem; letter-spacing:.15em; text-transform:uppercase; color:var(--text-muted); }

        .field-error { font-size:.72rem; color:var(--neon-pink); margin-top:.4rem; }

        .btn-submit {
            width:100%; padding:.95rem; margin-top:.5rem;
            background:var(--neon-pink); border:none; cursor:pointer;
            font-family:var(--ff-display); font-size:1.05rem;
            letter-spacing:.22em; color:white;
            box-shadow:0 0 30px rgba(255,45,120,0.3);
            transition:all .25s;
        }
        .btn-submit:hover { background:#ff4d8a; box-shadow:0 0 50px rgba(255,45,120,0.5); transform:translateY(-1px); }

        .back-link {
            display:flex; align-items:center; justify-content:center; gap:.5rem;
            margin-top:1.75rem;
            font-size:.7rem; letter-spacing:.18em; text-transform:uppercase;
            color:var(--text-muted); text-decoration:none; transition:color .2s;
        }
        .back-link:hover { color:var(--text); }
    </style>
</head>
<body>

<div class="bg-wrap">
    <div class="bg-orb bg-orb-1"></div>
    <div class="bg-orb bg-orb-2"></div>
</div>
<div class="bg-grid"></div>

<div class="page">
    <div class="card">

        <img src="{{ asset('images/logo.png') }}" alt="Masterpiece" class="card-logo">

        <div class="eyebrow">Password Baru</div>
        <h1 class="card-title">BUAT <span>PASSWORD</span></h1>
        <p class="card-desc">Masukkan password baru Anda di bawah ini.</p>

        <form method="POST" action="{{ route('password.store') }}">
            @csrf
            <input type="hidden" name="token" value="{{ $request->route('token') }}">

            {{-- Email --}}
            <div class="field">
                <label for="email">Email</label>
                <div class="field-inner">
                    <span class="field-icon">✉</span>
                    <input type="email" id="email" name="email"
                           value="{{ old('email', $request->email) }}"
                           placeholder="admin@masterpiece.com"
                           required autocomplete="email">
                </div>
                @error('email')
                    <p class="field-error">⚠ {{ $message }}</p>
                @enderror
            </div>

            {{-- Password baru --}}
            <div class="field">
                <label for="password">Password Baru</label>
                <div class="field-inner">
                    <span class="field-icon">🔒</span>
                    <input type="password" id="password" name="password"
                           placeholder="Min. 8 karakter"
                           required autocomplete="new-password"
                           oninput="checkStrength(this.value)">
                    <button type="button" class="toggle-pw" onclick="togglePw('password', this)">👁</button>
                </div>
                <div class="pw-strength">
                    <div class="pw-strength-bar"><div class="pw-strength-fill" id="strength-bar"></div></div>
                    <span class="pw-strength-label" id="strength-label">Masukkan password</span>
                </div>
                @error('password')
                    <p class="field-error">⚠ {{ $message }}</p>
                @enderror
            </div>

            {{-- Konfirmasi password --}}
            <div class="field">
                <label for="password_confirmation">Konfirmasi Password</label>
                <div class="field-inner">
                    <span class="field-icon">🔒</span>
                    <input type="password" id="password_confirmation"
                           name="password_confirmation"
                           placeholder="Ulangi password baru"
                           required autocomplete="new-password">
                    <button type="button" class="toggle-pw" onclick="togglePw('password_confirmation', this)">👁</button>
                </div>
            </div>

            <button type="submit" class="btn-submit">SIMPAN PASSWORD →</button>
        </form>

        <a href="{{ route('login') }}" class="back-link">← Kembali ke Login</a>

    </div>
</div>

<script>
function togglePw(fieldId, btn) {
    const input = document.getElementById(fieldId);
    input.type = input.type === 'password' ? 'text' : 'password';
    btn.textContent = input.type === 'password' ? '👁' : '🙈';
}

function checkStrength(val) {
    const bar   = document.getElementById('strength-bar');
    const label = document.getElementById('strength-label');
    let score = 0;
    if (val.length >= 8)  score++;
    if (/[A-Z]/.test(val)) score++;
    if (/[0-9]/.test(val)) score++;
    if (/[^A-Za-z0-9]/.test(val)) score++;

    const levels = [
        { w:'0%',   color:'transparent',  text:'Masukkan password' },
        { w:'25%',  color:'#e05252',       text:'Lemah' },
        { w:'50%',  color:'#e0a052',       text:'Cukup' },
        { w:'75%',  color:'#9B30FF',       text:'Kuat' },
        { w:'100%', color:'#50B878',       text:'Sangat Kuat ✓' },
    ];
    const lvl = val.length === 0 ? levels[0] : levels[score];
    bar.style.width     = lvl.w;
    bar.style.background = lvl.color;
    label.textContent   = lvl.text;
    label.style.color   = lvl.color;
}
</script>

</body>
</html>
