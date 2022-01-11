Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 78DCF48BB8B
	for <lists+linux-cachefs@lfdr.de>; Wed, 12 Jan 2022 00:40:10 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-592-STLZnUoGP9eeswIpupxi7g-1; Tue, 11 Jan 2022 18:40:08 -0500
X-MC-Unique: STLZnUoGP9eeswIpupxi7g-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5C06E81EE60;
	Tue, 11 Jan 2022 23:40:05 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C69F15E4B7;
	Tue, 11 Jan 2022 23:40:04 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id CB5164BB7C;
	Tue, 11 Jan 2022 23:40:02 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 20BNdsee009156 for <linux-cachefs@listman.util.phx.redhat.com>;
	Tue, 11 Jan 2022 18:39:55 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id CA588218013F; Tue, 11 Jan 2022 23:39:54 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C4C78217B403
	for <linux-cachefs@redhat.com>; Tue, 11 Jan 2022 23:39:43 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
	bits)) (No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C14BA85A5AA
	for <linux-cachefs@redhat.com>; Tue, 11 Jan 2022 23:39:43 +0000 (UTC)
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
	d=dkim.mimecast.com; s=201903; t=1641944383;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	in-reply-to:in-reply-to:references:references:dkim-signature;
	bh=4Z3sqpGIFVL84J+SH3/JqcsCmk3/t539vZt80mjQAn0=;
	b=h9Jjz50vPJAK19SmG1VbvITsUBCgAp0Q6Qm+5EMFNWVbIPijXmd4VTJq+RqV4IdWXJZj9r
	Oq/yC07zi9GV6p0dCnCaSqVHoyrFT47bb7xBUZSQsDNBfYZwXgjBtAsUrajjJyWUKPMw3k
	7cIWowiiYqx5ym3UlQnLWXmR46H8kSM99IBFgwGglR+QzZ5g6MIJJf8VsQEYVEtdVsIer0
	GsycbzrYkL0BU8wAEsPD5DOEJsE+8H/4ggyJgxxVPt1oP8bjGk2nIiRunTnxB8HgpQ9zoK
	fkXC7FAB+4W8Dp37HbpdC/oNPtI8EQyeXAd+AXVFSeBHprtiC2m2kV3+NwXwkA==
ARC-Seal: i=1; s=201903; d=dkim.mimecast.com; t=1641944383; a=rsa-sha256;
	cv=none;
	b=ZP3zK7L4k5jpKtlQ8f7sYfD+YzxQLHxDlaVNyiH8Xtwyl5EZr5piRBN+rdSy5xN1Cn47BV
	E0OrVkNX0mgq86DIVlmQi1lIND7f/KQJDG+Vt0hvMc0oP4CivHTsIhJe+iQuVrX3QMVfUi
	YJhq/UzjexMarnLmCKGUivqRK67vWdq9p6Z4xP7UnYRvi/q6orYm7u1iZMPe06nQBnjrHb
	2ix9UHfA+3CfLu54yLrpUNQApcZYLL1LZvoNHoZTVB7w6wwmB4MieaD+xNQrtsCIOQ9Z83
	ZRI6x/kYpt6RmMu4dKEpkM7UUt6DpWjPgKYCSzDd1FDQNLj8jZBbEZ5m19eRiw==
ARC-Authentication-Results: i=1; relay.mimecast.com;
	dkim=pass header.d=canb.auug.org.au header.s=201702 header.b=CAL+VhB7; 
	dmarc=none;
	spf=pass (relay.mimecast.com: domain of sfr@canb.auug.org.au designates
	150.107.74.76 as permitted sender)
	smtp.mailfrom=sfr@canb.auug.org.au
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76]) by
	relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	us-mta-377-sz1zn9JvOo6Q7QW22NajpQ-1; Tue, 11 Jan 2022 18:39:42 -0500
X-MC-Unique: sz1zn9JvOo6Q7QW22NajpQ-1
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits)
	server-digest SHA256) (No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4JYRmM5gZ5z4xmx;
	Wed, 12 Jan 2022 10:31:47 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1641943919;
	bh=4Z3sqpGIFVL84J+SH3/JqcsCmk3/t539vZt80mjQAn0=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=CAL+VhB7tnGuerjBXg+KBrIXNM5L47Grr2Z7MctVembeA/rhXP/4Qlff+eCDzsasV
	m07b4UblcBcm43Gt6g+CJaaPiTBASmT/8BpIYuXG0NheZif123+Jx3mSG4ghjD5Bnr
	vKKAPvQRgL6gxoRfQc3w+t52HyU2Os/2DuZKOZTS1fOqFAoDtgP7C2312g4o2oCT9E
	ERz+u6FsuLxtJw9CYnZASZbrKyZ1A31xsC+V69GzuN44Trb8RVnjGBHrbSpTbGiYjQ
	FJEC1IE7aJxnO2oJnV8uNmJItDD1jVnRm6IH/ot9+21m/9tIAwlSSUqFWNTrs1TqXI
	8mSVssM+Jlbjw==
Date: Wed, 12 Jan 2022 10:31:46 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: David Howells <dhowells@redhat.com>
Message-ID: <20220112103146.03c88319@canb.auug.org.au>
In-Reply-To: <510611.1641942444@warthog.procyon.org.uk>
References: <510611.1641942444@warthog.procyon.org.uk>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
	dkim=pass header.d=canb.auug.org.au header.s=201702 header.b=CAL+VhB7; 
	dmarc=none;
	spf=pass (relay.mimecast.com: domain of sfr@canb.auug.org.au designates
	150.107.74.76 as permitted sender)
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
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-loop: linux-cachefs@redhat.com
Cc: Latchesar Ionkov <lucho@ionkov.net>,
	Dominique Martinet <asmadeus@codewreck.org>, linux-mm@kvack.org,
	Dionne <marc.dionne@auristor.com>, linux-afs@lists.infradead.org,
	Shyam Prasad N <nspmangalore@gmail.com>, linux-cifs@vger.kernel.org, Marc,
	Matthew Wilcox <willy@infradead.org>, linux-cachefs@redhat.com,
	Trond Myklebust <trondmy@hammerspace.com>,
	v9fs-developer@lists.sourceforge.net, Daire Byrne <daire@dneg.com>,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	ceph-devel@vger.kernel.org, linux-nfs@vger.kernel.org,
	Zhaoyang Huang <zhaoyang.huang@unisoc.com>,
	Jeff Layton <jlayton@kernel.org>, linux-kernel@vger.kernel.org,
	Steve French <sfrench@samba.org>, linux-fsdevel@vger.kernel.org,
	Omar Sandoval <osandov@osandov.com>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Anna Schumaker <anna.schumaker@netapp.com>
Subject: Re: [Linux-cachefs] [GIT PULL] fscache, cachefiles: Rewrite
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
Content-Type: multipart/mixed; boundary="===============8611314713363182034=="
Sender: linux-cachefs-bounces@redhat.com
Errors-To: linux-cachefs-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13

--===============8611314713363182034==
Content-Type: multipart/signed; boundary="Sig_/TSD_6X.o4QL4mtle5E/6NvU";
	protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/TSD_6X.o4QL4mtle5E/6NvU
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi David,

On Tue, 11 Jan 2022 23:07:24 +0000 David Howells <dhowells@redhat.com> wrot=
e:
>
>     I think also that a conflict[10] spotted by Stephen Rothwell between =
my
>     series and some changes that went in since the branching point
>     shouldn't be an issue with this removed.

There is also this conflict against the pifdf tree (which may or may
not be merged before this):

https://lore.kernel.org/all/20211206090755.3c6f6fe4@canb.auug.org.au/

--=20
Cheers,
Stephen Rothwell

--Sig_/TSD_6X.o4QL4mtle5E/6NvU
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmHeE2IACgkQAVBC80lX
0GykKgf+LY4OWHMyvWj+UkQIEcaKG5r9OhPcLyt0zfDe0PRZQmlxXnY3gTri4emO
7Fj3IMkvEOSOP3VZlIRTpYauhwuCpB+yQDB/8X303z+a2aF9f/K1wrt0wvfGAqUY
qlGXd0zwWB9XPkGCkYEMi5oVP6TbMKajCMkq5rFhZcQS7YfHrWS/uJhpcmeVU0gn
BYKtZyQ5RBY8RImGGBnhGjQLxhXBn90mi729iNaFVPzeonasUxYQzZaiWSMGxWov
a2RcKHhg+dwlj1BTgB3lEnny9EM57priTBX8HnJwconRDhrWaGBv+k973nnHHZq0
x1fteziRSjCPvg4mlWtvA8XrBSjL1g==
=alke
-----END PGP SIGNATURE-----

--Sig_/TSD_6X.o4QL4mtle5E/6NvU--


--===============8611314713363182034==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs
--===============8611314713363182034==--

