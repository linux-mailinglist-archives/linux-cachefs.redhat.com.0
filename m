Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTP id E2032390212
	for <lists+linux-cachefs@lfdr.de>; Tue, 25 May 2021 15:21:54 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-564-1lp3NUfUNQWP-0J2M0XG0A-1; Tue, 25 May 2021 09:21:51 -0400
X-MC-Unique: 1lp3NUfUNQWP-0J2M0XG0A-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D17FC805EF4;
	Tue, 25 May 2021 13:21:48 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id BFFB65C241;
	Tue, 25 May 2021 13:21:48 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 8F4581801029;
	Tue, 25 May 2021 13:21:48 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 14L5Dfbq024134 for <linux-cachefs@listman.util.phx.redhat.com>;
	Fri, 21 May 2021 01:13:41 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 551F220AE849; Fri, 21 May 2021 05:13:41 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4E2E820AE837
	for <linux-cachefs@redhat.com>; Fri, 21 May 2021 05:13:37 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id BB360185A79C
	for <linux-cachefs@redhat.com>; Fri, 21 May 2021 05:13:37 +0000 (UTC)
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
	d=dkim.mimecast.com; s=201903; t=1621574017;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	in-reply-to:in-reply-to:references:references:dkim-signature;
	bh=wEtUY7MF3azD3WdFFJALhdqI7gxG/TwlaHI+vJoKY5k=;
	b=MZ0dJ8/LhUcQ5kHGGsFmSpHsic1tHEUdr3iDP2CN1yc6wg+LyQjW+ln+s8+SRlZK9ALTfx
	ndPMydZb95S79j1B1r+iZdxRErBPCIdo2KrgluslXi59sH69J4h7i8KGzjR94TgLFoq2le
	+Tn5JUhjqiu8qgJcGdg9V4EECH6hzDdpOvXKECPdz55GWAPCP0r9cyLM5tvL68HWFRlKqg
	MRa1ydgX/T8dtSCQQ36bDvtIf/PBHx+zYx51nSmVwuVQZNXTaJIMsaEhnGpxmGsj6ahs65
	HEhRdN6nODoHMUL4eWSkaTSfEXMsIxuKlwyjSlCsojjrpHAzQ8rhtMbIfppnWw==
ARC-Seal: i=1; s=201903; d=dkim.mimecast.com; t=1621574017; a=rsa-sha256;
	cv=none;
	b=h6BPYRyLcJ7pzDDqfcdqNfjgv3++X0eBoFFVXDHElDBPUUFUkBRAq0wSVWlPtm44fFJVfj
	kl0+WbTkWgg0bJJwTtohP6XFNwlcanyYyW/ul2sxd858xByZKeo15PdXUSIV/y8HtvWVnY
	FGCTm8xtiLBMAClHl4NOo9uxu9v/2DbfPSW4Jdg5PXMdzHrxgdS1U1Bv7llIHRAM50UKQB
	yMkKZh3sDf4dxwdri8eueIrxX+oWavMwr66IDgHSPDYoVC5YwApFuz9Hsyw7YX7l2DIJwW
	LfZPygZ/KQXnYnvgI0JcUn0b4876hyJjNsctSVMXDyplBhoXJXB4sDB+Dur6Mw==
ARC-Authentication-Results: i=1; relay.mimecast.com;
	dkim=pass header.d=dilger-ca.20150623.gappssmtp.com header.s=20150623
	header.b=H7YCLMRn; dmarc=none;
	spf=pass (relay.mimecast.com: domain of adilger@dilger.ca designates
	209.85.216.45 as permitted sender)
	smtp.mailfrom=adilger@dilger.ca
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com
	[209.85.216.45]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-352-lQx97qVJOoutTyreuY2j0w-1; Fri, 21 May 2021 01:13:34 -0400
X-MC-Unique: lQx97qVJOoutTyreuY2j0w-1
Received: by mail-pj1-f45.google.com with SMTP id
	b13-20020a17090a8c8db029015cd97baea9so6505056pjo.0
	for <linux-cachefs@redhat.com>; Thu, 20 May 2021 22:13:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=dilger-ca.20150623.gappssmtp.com; s=20150623;
	h=from:message-id:mime-version:subject:date:in-reply-to:cc:to
	:references; bh=bgS4pF9Ne9nJ3937pRt34Uv0EWKH/eisWTbh6rzbM2w=;
	b=H7YCLMRndDIQtTj6d8jQriGetGwG4I300X506G4hPwBq8a4n2I2NZQzF7tomfz4sfo
	XcCfuvIU9xiUuJlVfA2W9pGVXtv+5fnlaRrYyxu4HpQ/IpTa+MlPwfbq9J56mg3OYDkm
	w48ZefoatPt2VudvdYTxqF4DQRC7Z4dNz6vx8T7bdmDis5Th3R7RjwmgU2rQr3Xv2VRT
	M5SMZnhnsjREFoE8AGFO/IQaRoGavNPIqZGY1OWy9Ocdz/GrLeg8bfJWeXtAmlxvEq4O
	2Quwnfw1tA9Mj5UARwdueHmvmJ59a2E/YBbtXnhax+e4iuvjw9C1ttc0DE+1UBIy04yD
	zU6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:message-id:mime-version:subject:date
	:in-reply-to:cc:to:references;
	bh=bgS4pF9Ne9nJ3937pRt34Uv0EWKH/eisWTbh6rzbM2w=;
	b=TnLjF4R0Ht8ZKqOaB/CB8+EFFVx0AG5duyq6wCExuYnOIhOijFNvk4WYY+7v0FwIjO
	CRZ6lZ48CD7ewlNz+zndEuHkKMEif6uYHivZqfTCJQxtjF5heMaLCTbfRbcB2zSZgDCU
	aCWM3zNOKJgUNfsvDAadVSHQ6BIIb3P4n/FMa4nnu09i4TI+i6eDOEyWhp604BtjOjVR
	oMLdwL1PcFburblf3VeSTagyT3BDhwCWyrLto/NEIf3uZHggmyGVFioYdRvK1CtWnxOW
	GK9YNxlDKbp3QiujJTaTmjAbAeN5xm7bETvCIIl/NS0FoaElX8MeN7bHW56Ub4PDFl54
	1W4g==
X-Gm-Message-State: AOAM533D6wU9yAdpxqcQm4TopenUkzrINWnJ0AHZyJPuyR4ujR86oLAe
	T6JBaWHI//S2vPJ1YSNQ0tA19ZJlt0bVEYyEJas=
X-Google-Smtp-Source: ABdhPJw+V5ShgApxNxW34140eavfSn3skDwRCF9/zx690qZo2q8BklpLFc4augcHT2DreEMSI2l/lw==
X-Received: by 2002:a17:90a:a106:: with SMTP id
	s6mr8815490pjp.170.1621574012699; 
	Thu, 20 May 2021 22:13:32 -0700 (PDT)
Received: from cabot.adilger.int (S01061cabc081bf83.cg.shawcable.net.
	[70.77.221.9]) by smtp.gmail.com with ESMTPSA id
	cv24sm3519057pjb.7.2021.05.20.22.13.30
	(version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 20 May 2021 22:13:31 -0700 (PDT)
From: Andreas Dilger <adilger@dilger.ca>
Message-Id: <6E4DE257-4220-4B5B-B3D0-B67C7BC69BB5@dilger.ca>
Mime-Version: 1.0 (Mac OS X Mail 10.3 \(3273\))
Date: Thu, 20 May 2021 23:13:28 -0600
In-Reply-To: <206078.1621264018@warthog.procyon.org.uk>
To: David Howells <dhowells@redhat.com>
References: <206078.1621264018@warthog.procyon.org.uk>
Authentication-Results: relay.mimecast.com;
	dkim=pass header.d=dilger-ca.20150623.gappssmtp.com header.s=20150623
	header.b=H7YCLMRn; dmarc=none;
	spf=pass (relay.mimecast.com: domain of adilger@dilger.ca designates
	209.85.216.45 as permitted sender)
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
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-loop: linux-cachefs@redhat.com
X-Mailman-Approved-At: Tue, 25 May 2021 09:17:16 -0400
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
Content-Type: multipart/mixed; boundary="===============4968181181828085328=="
Sender: linux-cachefs-bounces@redhat.com
Errors-To: linux-cachefs-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16

--===============4968181181828085328==
Content-Type: multipart/signed;
	boundary="Apple-Mail=_9ABD2FFE-ADCA-4E79-B98F-629817F7E7A3";
	protocol="application/pgp-signature"; micalg=pgp-sha256

--Apple-Mail=_9ABD2FFE-ADCA-4E79-B98F-629817F7E7A3
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii

On May 17, 2021, at 9:06 AM, David Howells <dhowells@redhat.com> wrote:
> With filesystems like ext4, xfs and btrfs, what are the limits on directo=
ry
> capacity, and how well are they indexed?
>=20
> The reason I ask is that inside of cachefiles, I insert fanout directorie=
s
> inside index directories to divide up the space for ext2 to cope with the
> limits on directory sizes and that it did linear searches (IIRC).
>=20
> For some applications, I need to be able to cache over 1M entries (render
> farm) and even a kernel tree has over 100k.
>=20
> What I'd like to do is remove the fanout directories, so that for each lo=
gical
> "volume"[*] I have a single directory with all the files in it.  But that
> means sticking massive amounts of entries into a single directory and hop=
ing
> it (a) isn't too slow and (b) doesn't hit the capacity limit.

Ext4 can comfortably handle ~12M entries in a single directory, if the
filenames are not too long (e.g. 32 bytes or so).  With the "large_dir"
feature (since 4.13, but not enabled by default) a single directory can
hold around 4B entries, basically all the inodes of a filesystem.

There are performance knees as the index grows to a new level (~50k, 10M,
depending on filename length)

As described elsewhere in the thread, allowing concurrent create and unlink
in a directory (rename probably not needed) would be invaluable for scaling
multi-threaded workloads.  Neil Brown posted a prototype patch to add this
to the VFS for NFS:

https://lore.kernel.org/lustre-devel/8736rsbdx1.fsf@notabene.neil.brown.nam=
e/

Maybe it's time to restart that discussion?

Cheers, Andreas






--Apple-Mail=_9ABD2FFE-ADCA-4E79-B98F-629817F7E7A3
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - http://gpgtools.org

iQIzBAEBCAAdFiEEDb73u6ZejP5ZMprvcqXauRfMH+AFAmCnQXgACgkQcqXauRfM
H+CtAhAArkAICuRAycDLoFhi3+HEtLyGeg8lvr/V0czSXjKcz0kgsjnpRjQKWW3M
k4bKUagfH8Y0i3oN2BQ6Tdra0KDtyTFzOGCNFj4u6mnFNwK5ONw3xdrVG7AEmrqj
Xw9a0yQ46vvcUNXnTYVD9yL4Rzb9NSqbJStenwhO7OdG0kYY8WcS9sWo2ycnsHmc
oxWFFTaM+CRe0SIirT92MbzJtDdbEPBxVHLtdw9tE9+jSfc547+42N0UmEO/kAxL
cbObKq9zPsNICHraAoBKusp66p6r4TxlTVXt8sS72PBIn2zKjvYRBdhRZy8DcnCi
7+uj4VQp9JpeSCB7hqDdUQuUCXkJs2emvxiQv+F1mGjyYSXveDhdQwbcF/6zKqjk
aCFJNDKH4xvVQpUg7diBKnuf0nhdOgn18m+RnGidSFH52xYR1AI3vtzN9BuN76At
w0vhpElqyfj6CpJuKh+uAnyAWgE+tqebaSOXQbFGBx6rpelp9kKxzpmusjn5Xpj6
DWIiSqSLGtJnBQo1PyqWQykqR7het6xNCTIn6TWMDqZNSZ2vCZ4smrVWgl+CZthn
o6gBqI6SsXwRPCUh5qIMVqVPWcFvvdFUoYltKDG6w7sNaON+UhtcMSrLxwiJA9FA
/7Ezr8zglU/AB4wrGwd/4aTHrQWdLwn6Ww0HpYTqNNqpMAsSMgA=
=A2zI
-----END PGP SIGNATURE-----

--Apple-Mail=_9ABD2FFE-ADCA-4E79-B98F-629817F7E7A3--


--===============4968181181828085328==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs
--===============4968181181828085328==--

