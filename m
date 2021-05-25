Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTP id 71062390C85
	for <lists+linux-cachefs@lfdr.de>; Wed, 26 May 2021 00:59:07 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-202-1tgDLak8NC6bgP-BQPQm5w-1; Tue, 25 May 2021 18:59:04 -0400
X-MC-Unique: 1tgDLak8NC6bgP-BQPQm5w-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 329E1801B12;
	Tue, 25 May 2021 22:59:02 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E47B4100760F;
	Tue, 25 May 2021 22:59:01 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 9D8A21801029;
	Tue, 25 May 2021 22:59:01 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 14PMwwP2010528 for <linux-cachefs@listman.util.phx.redhat.com>;
	Tue, 25 May 2021 18:58:58 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id A1A631000DA7; Tue, 25 May 2021 22:58:58 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9D1AF1000DB3
	for <linux-cachefs@redhat.com>; Tue, 25 May 2021 22:58:55 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 655C7833942
	for <linux-cachefs@redhat.com>; Tue, 25 May 2021 22:58:55 +0000 (UTC)
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
	d=dkim.mimecast.com; s=201903; t=1621983535;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	in-reply-to:in-reply-to:references:references:dkim-signature;
	bh=9xLq235SZKEmFz1B5BSrbhgZywaR37MCvi7nW7EBEzI=;
	b=PaDjS9ezeaTKKPBbfStJjennBZsby0t9K2xyW07YiNwHOgpqEObbXBPSZx2BcdVLONvoUh
	tr9PxNTbflf8qfvXLLGFFN3FxU78h+MdEO2rhGPqSmhmeWDpa5ecRF8wpkUm7pedmDYvJ0
	SA7smb92misQwrqbz45vkdO4l4dRZawPi3zffLvYJuR92/ciN0nUWgtLRj1GdCvaA7/Fhv
	isK0EBlfXXAM1PdX+L2vYdhHrkjYpWO9WdFp1PloX9WWKYPSmoPy+T2iu8YHM4ns59VBTq
	DuoperCeZGR/veXZmFjQyAgZg/lT2BJdNaBIGEECQwEYpxFn6crpbGu6+PVafA==
ARC-Seal: i=1; s=201903; d=dkim.mimecast.com; t=1621983535; a=rsa-sha256;
	cv=none;
	b=lDKV/ZRvNN9+R1a84YuZV8WByT/kdt+E2GsA7psy8WVIUPTx3iejHhxWn9PpCJh+J+vN2f
	9D3+Cqljun+IdnUn4Du620r41EhE+aieNfVsJ/VphMXg/ZTHVoQsom8ZCnTs9LWste3zGf
	PAUs6vzAtNKugnpK0VKGrB0ePj+fudUQm9K5gwSA4UOBazqyczJXuhM5CWUhJf3G5bkakv
	UljNOcQ4U0Ar9pTk26KVEDXAL+mc7ozm0+qhss/eU3gO+0XPttpmQ7ONBhhdhrKz+8smDW
	WCV2ixYGNH7dsK/WDNE8f61Uaa3hY15pZXN3+a5W9JBWXdC6fl1vSE5fbMkBlg==
ARC-Authentication-Results: i=1; relay.mimecast.com;
	dkim=pass header.d=dilger-ca.20150623.gappssmtp.com header.s=20150623
	header.b=JPaJiOKA; dmarc=none;
	spf=pass (relay.mimecast.com: domain of adilger@dilger.ca designates
	209.85.215.177 as permitted sender)
	smtp.mailfrom=adilger@dilger.ca
Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com
	[209.85.215.177]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-99-1CC14QCuO5OKtiHXCRRc4w-1; Tue, 25 May 2021 18:58:52 -0400
X-MC-Unique: 1CC14QCuO5OKtiHXCRRc4w-1
Received: by mail-pg1-f177.google.com with SMTP id t193so23957008pgb.4
	for <linux-cachefs@redhat.com>; Tue, 25 May 2021 15:58:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=dilger-ca.20150623.gappssmtp.com; s=20150623;
	h=from:message-id:mime-version:subject:date:in-reply-to:cc:to
	:references; bh=hX/rBRm4QBlH/CR3lcT9LZd/ibBac3+Los/O0LgpfN8=;
	b=JPaJiOKAFtl4YgkTR2sFRag6X4h46sqRtvl5nPyZF0O9mwHyddop5CtADZ+IoEYJ7u
	ZhWdjnIGzXZIlPe0JfgZiGlVDe8LTr07UOQpub3mZp8GoE+Eq9tCbYOO0g7s17G36yX7
	aIyjMTk+DiPtxJY7ndeSaQ2JPhNatVClFD6f/WPfwVfIps28iyX9YqO7cBEBweUnxMZM
	6l/9msuNuvIv5qxB+dahsJXKedXf87+BfoapTwN/fjjljnSBIuWKFy0lzktcj52jk4x9
	DL6qHmZKvtfYrIzgTMpLhOrHKknNMcrt/ayup5WfeQcCVjeYDB26nhgyIyqsnGJUX046
	xrWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:message-id:mime-version:subject:date
	:in-reply-to:cc:to:references;
	bh=hX/rBRm4QBlH/CR3lcT9LZd/ibBac3+Los/O0LgpfN8=;
	b=ItQsxeac7TL3Tg0vwQf0KqtdDx5X2NOnT4ErqYLl2aJ+GFBIFPTP2KDUKnNm+iM1oE
	cdXbjr1buWG6WKyWgnR8hFOFH9ZhVYm8c28ntZ7ZyUA0H6u5cDrUlEDsgxf0/3r3a+Cn
	+/tUaogJ6BS3Ia/NNW4X0EFZlHp94lkIjcJD626m+Jk/WKU/Q/YaQwHqQG1Yo4pSAQEn
	gp2mJMbsXLrAePzbgGkWAr9LlaNH2qte3xxG0m1n5mGsZz3223cQ98owVZw7IBpXnGbr
	zFSCVY8g4hz+HwUthEhH2pvs7OI/6+8Uufx3zeQOafoBxj4SFl3zHurMENql7EhZLWvd
	aj/w==
X-Gm-Message-State: AOAM531xG/Ns3diV6mgzDKzQqtQUdHWu0X07zgRu0x05TvM0J5V6NKXG
	HTnuBKhOrH8OihIuO0PkD0o89g==
X-Google-Smtp-Source: ABdhPJyQrIl3kRoE1Ih5TyGz1SYTeMGl+VDTZuFHOs62rbg/s1kQA6rx87GCdoklhMLU3ZT66ZNPlA==
X-Received: by 2002:a63:175e:: with SMTP id 30mr21625140pgx.48.1621983531380; 
	Tue, 25 May 2021 15:58:51 -0700 (PDT)
Received: from cabot.adilger.int (S01061cabc081bf83.cg.shawcable.net.
	[70.77.221.9]) by smtp.gmail.com with ESMTPSA id
	pg5sm10748895pjb.28.2021.05.25.15.58.50
	(version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 25 May 2021 15:58:50 -0700 (PDT)
From: Andreas Dilger <adilger@dilger.ca>
Message-Id: <00224B62-4903-4D33-A835-2DC8CC0E3B4D@dilger.ca>
Mime-Version: 1.0 (Mac OS X Mail 10.3 \(3273\))
Date: Tue, 25 May 2021 16:58:48 -0600
In-Reply-To: <4169583.1621981910@warthog.procyon.org.uk>
To: David Howells <dhowells@redhat.com>
References: <6E4DE257-4220-4B5B-B3D0-B67C7BC69BB5@dilger.ca>
	<206078.1621264018@warthog.procyon.org.uk>
	<4169583.1621981910@warthog.procyon.org.uk>
Authentication-Results: relay.mimecast.com;
	dkim=pass header.d=dilger-ca.20150623.gappssmtp.com header.s=20150623
	header.b=JPaJiOKA; dmarc=none;
	spf=pass (relay.mimecast.com: domain of adilger@dilger.ca designates
	209.85.215.177 as permitted sender)
	smtp.mailfrom=adilger@dilger.ca
X-Mimecast-Spam-Score: -4
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-loop: linux-cachefs@redhat.com
Cc: Theodore Ts'o <tytso@mit.edu>, "Darrick J. Wong" <djwong@kernel.org>,
	NeilBrown <neilb@suse.com>, xfs <linux-xfs@vger.kernel.org>,
	Chris Mason <clm@fb.com>, linux-cachefs@redhat.com,
	linux-fsdevel <linux-fsdevel@vger.kernel.org>,
	Ext4 Developers List <linux-ext4@vger.kernel.org>,
	linux-btrfs <linux-btrfs@vger.kernel.org>
Subject: Re: [Linux-cachefs] How capacious and well-indexed are ext4,
 xfs and btrfs directories?
X-BeenThere: linux-cachefs@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
List-Id: Linux filesystem caching discussion list <linux-cachefs.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/linux-cachefs>, 
	<mailto:linux-cachefs-request@redhat.com?subject=unsubscribe>
List-Archive: <https://listman.redhat.com/archives/linux-cachefs>
List-Post: <mailto:linux-cachefs@redhat.com>
List-Help: <mailto:linux-cachefs-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/linux-cachefs>,
	<mailto:linux-cachefs-request@redhat.com?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============2767590334599599472=="
Sender: linux-cachefs-bounces@redhat.com
Errors-To: linux-cachefs-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22

--===============2767590334599599472==
Content-Type: multipart/signed;
	boundary="Apple-Mail=_3D8A3B39-D089-4DAF-B1B2-AD38E7039117";
	protocol="application/pgp-signature"; micalg=pgp-sha256

--Apple-Mail=_3D8A3B39-D089-4DAF-B1B2-AD38E7039117
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii

On May 25, 2021, at 4:31 PM, David Howells <dhowells@redhat.com> wrote:
>=20
> Andreas Dilger <adilger@dilger.ca> wrote:
>=20
>> As described elsewhere in the thread, allowing concurrent create and unl=
ink
>> in a directory (rename probably not needed) would be invaluable for scal=
ing
>> multi-threaded workloads.  Neil Brown posted a prototype patch to add th=
is
>> to the VFS for NFS:
>=20
> Actually, one thing I'm looking at is using vfs_tmpfile() to create a new=
 file
> (or a replacement file when invalidation is required) and then using
> vfs_link() to attach directory entries in the background (possibly using
> vfs_link() with AT_LINK_REPLACE[1] instead of unlink+link).
>=20
> Any thoughts on how that might scale?  vfs_tmpfile() doesn't appear to re=
quire
> the directory inode lock.  I presume the directory is required for securi=
ty
> purposes in addition to being a way to specify the target filesystem.

I don't see how that would help much?  Yes, the tmpfile allocation would be
out-of-line vs. the directory lock, so this may reduce the lock hold time
by some fraction, but this would still need to hold the directory lock
when linking the tmpfile into the directory, in the same way that create
and unlink are serialized against other threads working in the same dir.

Having the directory locking scale with the size of the directory is what
will get orders of magnitude speedups for large concurrent workloads.
In ext4 this means write locking the directory leaf blocks independently,
with read locks for the interior index blocks unless new leaf blocks are
added (they are currently never removed).

It's the same situation as back with the BKL locking the entire kernel,
before we got fine-grained locking throughout the kernel.

>=20
> David
>=20
> [1] https://lore.kernel.org/linux-fsdevel/cover.1580251857.git.osandov@fb=
.com/
>=20


Cheers, Andreas






--Apple-Mail=_3D8A3B39-D089-4DAF-B1B2-AD38E7039117
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - http://gpgtools.org

iQIzBAEBCAAdFiEEDb73u6ZejP5ZMprvcqXauRfMH+AFAmCtgSgACgkQcqXauRfM
H+CDVxAAnze/K3njMsggycsga9Pgt7jRP/ffBygbtoqyKa4k3uzv2ENQ2Ldlf8KL
qgBUHNOQFTohqS3ZxcLCKB8pSYPk6MFO6dddL9sLO5iKEr3NSQtWoN55tCQOGAgw
zB9WAVud0IkDzW8Eppy0bo5YEH6ELgxp2uCNssdGAN24UQsK5s6HdxWWZNTkiJLE
U88ttdsgVNls0mNovoSebNVnO0ka5XFofqzCnALYcq8hI8N2Q4JmRXz2TTkmiwZY
TURlyBIMCa07a8l8ga7htpXjN8FqkB+XVcC5tPzrMUEtfVlll8mrZIoBo8oxiHIg
yWhNiqsV1N5HzXc6ME5LtyXaUzuuWug8fGI4+ryFRedEp1Nio5NV8gtfT7gZl9Fr
sI3JoMyJg5W14TiYAqw3+CbvtUpBaPaG0I5mFKFyrfXKoFL+gDinonnaV5iu1bXX
a/ra56wsobuoIDFOFftXW4U74MLHU0z63zgmhFjtt2PSgf62Tl8QYQYwusjFOuuD
qsXcuwdRm+7JWSNSeyQDCIC8JSiqOzhbWx6lApiBGAB2wPrOZeJFmGbGChD2YByR
GolsClW3YvJf2gYkOd/pHjgYpUqiqTKtvfieKPGI4Auy0AW0ibPzFzsMpL9NnI7M
iU4n2bpxBVaUuk3KxJqHkKE9+0/aNcE/Orq4ULkO50hfDlwaUTY=
=V/Um
-----END PGP SIGNATURE-----

--Apple-Mail=_3D8A3B39-D089-4DAF-B1B2-AD38E7039117--


--===============2767590334599599472==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs
--===============2767590334599599472==--

