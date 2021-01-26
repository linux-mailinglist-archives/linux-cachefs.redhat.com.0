Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id 3DB69303C56
	for <lists+linux-cachefs@lfdr.de>; Tue, 26 Jan 2021 13:00:29 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-438-oe6Eg7k8OdiGKkRHjVeB1g-1; Tue, 26 Jan 2021 07:00:25 -0500
X-MC-Unique: oe6Eg7k8OdiGKkRHjVeB1g-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8BC068017FB;
	Tue, 26 Jan 2021 12:00:22 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 99C9C5C276;
	Tue, 26 Jan 2021 12:00:21 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 93725180954D;
	Tue, 26 Jan 2021 12:00:19 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 10QC0Fib022991 for <linux-cachefs@listman.util.phx.redhat.com>;
	Tue, 26 Jan 2021 07:00:15 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 7F916110F73A; Tue, 26 Jan 2021 12:00:15 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7B7A9110F738
	for <linux-cachefs@redhat.com>; Tue, 26 Jan 2021 12:00:12 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id F2BDB858284
	for <linux-cachefs@redhat.com>; Tue, 26 Jan 2021 12:00:11 +0000 (UTC)
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
	d=dkim.mimecast.com; s=201903; t=1611662411;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	in-reply-to:in-reply-to:references:references:dkim-signature;
	bh=ad2QtG23MXqR5UG0CTJzk97dZAgOb/ldsrztRRu763g=;
	b=cF5RYSwkfZQoxKGdWsxVWlxcYxOCv4YfCP/brMUwh4O6FIWLrXgnq5wo+SjJV0TzNWsSUQ
	m9qlH5ndDprztcoqE3/9DUhyUkM2QZHE4wkZ4OhysQAbaM27no9gTWzceURVyPfha5enhO
	SwXy4B1GwKreKejigNMu3bKwf3T07qTvUedh98BGh8ATzsIQnAJW5K6HwGP7pV6F3kF5L+
	3cnFW6gpC3wRIGa9s3SjSBf5v0Tp97KUx/OxxQBOLZqpMIG/gwE4S2G1TOB+/xljNs1zPq
	cFDzGUqr923iMdRmcHE4vE5mSwskSNAeJSivrgYl6RsMJQCMZHTTJUmG0ruZZw==
ARC-Seal: i=1; s=201903; d=dkim.mimecast.com; t=1611662411; a=rsa-sha256;
	cv=none;
	b=F//vv9sz0YHeaui14ZWUAcHE6w4BIsIGER1G8BOzAjDlaJBHLjAcXjLSBFfI38B2skSNqR
	9hcb3E83qwbvAajPb0hISnhG+0obap4zTvybFEJbYe6ePXjTlwVinR9T6iaVN9LKqrxBQx
	LXLRXZKozKG8Qoul7JkFU4J9Ji21EmT2I6fe/5oEMFpWDEY/jLRRCBTnWAg41Ky5yf6D7N
	1kL5+/rMvBYeJzEFBGMKc3dxbhsqQWS2//pL0iuKUoh8+VTTqrVTe78RItKz9ia9QZUfxc
	MBd+XC4EuA1klpQ+Zwj6zFdz7KT5N4IK0sfjcttAAzA6CrRgpa8vka0kD6B/uQ==
ARC-Authentication-Results: i=1; relay.mimecast.com;
	dkim=pass header.d=canb.auug.org.au header.s=201702 header.b=GAy6Kjkg; 
	dmarc=none;
	spf=pass (relay.mimecast.com: domain of sfr@canb.auug.org.au designates
	203.11.71.1 as permitted sender)
	smtp.mailfrom=sfr@canb.auug.org.au
Received: from ozlabs.org (ozlabs.org [203.11.71.1]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-231-H3uChuJ3Piiu0lXuSKB10g-1;
	Tue, 26 Jan 2021 07:00:08 -0500
X-MC-Unique: H3uChuJ3Piiu0lXuSKB10g-1
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits)
	server-digest SHA256) (No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4DQ4nV6mb8z9s24;
	Tue, 26 Jan 2021 22:51:10 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
	s=201702; t=1611661874;
	bh=0eQMEVT1gu8ENfr5plp+NINmLwG2I10lGKyNJgzw5vE=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=GAy6Kjkg6QqVM0ykQfOxUS/GvLwBnPbHCUqpb/7Vud2BiIN9Z6pSmvf38+wjACZUl
	nwjc01rIIfA9aY7/3RZBpiSx2ZDthJREj7htY8vJ3rDHgbtusbu39uyYUtg8KjPrPL
	lyI3kHfLs3t3dpGK+BHZDEDwUtWI96L3ltK/7NcsPjYt6GGl+olzujIkT1kP4Bbk8K
	IZmgDT6bVxCFu0itRIPiayBdcmDdODhVJPWHOJBuu8cJoVdnmE/nUAYEDAVR+aHJ6l
	89ilHgzT3sVa/3/t5mcsMWxlEbCrrIXGz4pvU45LPW0trihzOYOoGyvHCwgM4nHYcQ
	tqWCQMt3XLyaw==
Date: Tue, 26 Jan 2021 22:51:09 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: David Howells <dhowells@redhat.com>
Message-ID: <20210126225109.594f3df4@canb.auug.org.au>
In-Reply-To: <2541781.1611611590@warthog.procyon.org.uk>
References: <2541781.1611611590@warthog.procyon.org.uk>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
	dkim=pass header.d=canb.auug.org.au header.s=201702 header.b=GAy6Kjkg; 
	dmarc=none;
	spf=pass (relay.mimecast.com: domain of sfr@canb.auug.org.au designates
	203.11.71.1 as permitted sender)
	smtp.mailfrom=sfr@canb.auug.org.au
X-Mimecast-Spam-Score: -5
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
Cc: linux-nfs@vger.kernel.org, Dominique Martinet <asmadeus@codewreck.org>,
	Steve French <sfrench@samba.org>, linux-cachefs@redhat.com,
	Trond Myklebust <trondmy@hammerspace.com>,
	Schumaker <anna.schumaker@netapp.com>, Anna
Subject: Re: [Linux-cachefs] Adding my fscache-next branch to linux-next
X-BeenThere: linux-cachefs@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
List-Id: Linux filesystem caching discussion list <linux-cachefs.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/linux-cachefs>,
	<mailto:linux-cachefs-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-cachefs>
List-Post: <mailto:linux-cachefs@redhat.com>
List-Help: <mailto:linux-cachefs-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-cachefs>,
	<mailto:linux-cachefs-request@redhat.com?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============8025607090148951741=="
Sender: linux-cachefs-bounces@redhat.com
Errors-To: linux-cachefs-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16

--===============8025607090148951741==
Content-Type: multipart/signed; boundary="Sig_/igtUeq_GukrXnQJV32zrjEn";
	protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/igtUeq_GukrXnQJV32zrjEn
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi David,

On Mon, 25 Jan 2021 21:53:10 +0000 David Howells <dhowells@redhat.com> wrot=
e:
>
> Could you add my fscache-next branch, which is in this repo:
>=20
> =09git://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git
>=20
> to linux-next please?
>=20
> Note that it might conflict with anything Trond and/or Anna ask you to pu=
ll
> for NFS, in which case I'll drop the NFS patches from it and seek to get =
Trond
> and Anna to take them into the NFS tree.

Added from tomorrow.

Thanks for adding your subsystem tree as a participant of linux-next.  As
you may know, this is not a judgement of your code.  The purpose of
linux-next is for integration testing and to lower the impact of
conflicts between subsystems in the next merge window.=20

You will need to ensure that the patches/commits in your tree/series have
been:
     * submitted under GPL v2 (or later) and include the Contributor's
        Signed-off-by,
     * posted to the relevant mailing list,
     * reviewed by you (or another maintainer of your subsystem tree),
     * successfully unit tested, and=20
     * destined for the current or next Linux merge window.

Basically, this should be just what you would send to Linus (or ask him
to fetch).  It is allowed to be rebased if you deem it necessary.

--=20
Cheers,
Stephen Rothwell=20
sfr@canb.auug.org.au

--Sig_/igtUeq_GukrXnQJV32zrjEn
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmAQAi0ACgkQAVBC80lX
0Gwewgf/W9iXTJLgvqX+o6h/9cNBCUruxn6AQnHP+wwxQ/RRdXuOYKe2MJTPjXYJ
BUVI8esFmg1z7qETiWxaBpluIhB8mZowjZw8jcyV2ulz59PYzek8nQLhPrOBRziM
M95T5dy52HxAcAELaIv42unKsTO8Gwp/W219Q4uv+MP6XXHzmGbSoGLnYIM8TQXb
0yATAV6TouDEK0NcoUql9Mhk3vSQPEsN8ca6b8S4pOVynwjmGCqF60qvKf4jQ6lc
8XnN5pS+mGW393w04i4Rb5kmbpew/IbhkkAGqq/1eNxu2KhY3w6XkG4OiP2vpA0R
HPdLCjk7cBnF1F/rxccWBUOIV8QaTQ==
=Dno6
-----END PGP SIGNATURE-----

--Sig_/igtUeq_GukrXnQJV32zrjEn--


--===============8025607090148951741==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://www.redhat.com/mailman/listinfo/linux-cachefs
--===============8025607090148951741==--

