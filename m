Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	by mail.lfdr.de (Postfix) with ESMTP id D06C01CE83B
	for <lists+linux-cachefs@lfdr.de>; Tue, 12 May 2020 00:38:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1589236731;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:
	 references:references:list-id:list-help:list-unsubscribe:
	 list-subscribe:list-post; bh=bVAUOJuzhe8o4D7HFqa8Yx+jY18ibO/CRfLddzolHCo=;
	b=HIAseQfKvg1GzDvmKaTCJOibJOcyE3SbI4ob5l7u6rpxT4A6GsMkGVcFhCkxAbQDRdjnp+
	EqyXV/S+D6386Gik5RUAFP0Qs2/RJt9Cso7tavW/VU82ruxvAaCncA4EBhWwtOWYLlC2mm
	iGBH4/aXZv7OTxT+dXA/2t5Kcx6AKTY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-415-vFMuAAQNM42pjaXerWKsNA-1; Mon, 11 May 2020 18:38:49 -0400
X-MC-Unique: vFMuAAQNM42pjaXerWKsNA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id F1A7E107ACCD;
	Mon, 11 May 2020 22:38:45 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1FFE05C1B5;
	Mon, 11 May 2020 22:38:44 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id F35A01809541;
	Mon, 11 May 2020 22:38:38 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 04BMcYu5015935 for <linux-cachefs@listman.util.phx.redhat.com>;
	Mon, 11 May 2020 18:38:34 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 5D0E82026FFE; Mon, 11 May 2020 22:38:34 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 591B12026E1C
	for <linux-cachefs@redhat.com>; Mon, 11 May 2020 22:38:31 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6E7EF8008A3
	for <linux-cachefs@redhat.com>; Mon, 11 May 2020 22:38:31 +0000 (UTC)
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
	d=dkim.mimecast.com; s=201903; t=1589236711;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	in-reply-to:in-reply-to:references:references;
	bh=Dye8FtfVkLe+MEGjgCFo1EuzmoAy7E+fsKmWbODkcXk=;
	b=NUK7gIy/Pz3iYOX2v4lFFNaQow9O+CPHgyxjvRQJbejrWdf6wamiToOmWAVTLklYdcENlZ
	6X/UjtkrQPkrg0k9oIldEmbni1178l1plziC2LtcdAxjSG2danDzPkHqn7L9b7iY9CFBmS
	sYyxSUa0HDESg5SVysHB7doZUjOYmEMEe7eeeZv4t2dgBkD92ug5MqWjeQuOte4ZYCmhgN
	14s4hOFK9wQGA/AzYzH8zywaLDwD8Qc665KbADBREzFOkduj/m0NPQ6VNywFvFq0TeCehk
	t6MD/cd+LGoTCDiSYPyAD8gUIb4lbcR0Zx66l0euu8rVsw3ZAu+22PrtEikmLw==
ARC-Seal: i=1; s=201903; d=dkim.mimecast.com; t=1589236711; a=rsa-sha256;
	cv=none;
	b=h5vbemhsXXiy28spHzHFuAqx56NxITzLqeRLAIU+qWoThjtOzsm0K0FAN2rB5OLNxkEpj9
	Tr3aAsF99VtOWVYe+yVKfc3owatueGShCRMgO/6uF0bEEg/0Gs79SDjhcGnw+Q8n5IJiJF
	rZlPcQTeE92iAT4PSZFqrmKodghkyB30vYSK4vP3rWc3MwdDoT6IgbtbYUX17WPwVFiBXJ
	OIGLDdP0FoV64tNc9foLoKzz6dmytB37RZuqg7LBXX5oHgOZ2YKmZERJP3pLpbJwsnR3lG
	5ZEbprq/qnY3cOQaOcflGVY15dDJEr938/CK1AUZKqzVeeaboLiajjmsSDqBSQ==
ARC-Authentication-Results: i=1; relay.mimecast.com; dkim=none; dmarc=none;
	spf=pass (relay.mimecast.com: domain of neilb@suse.de designates
	195.135.220.15 as permitted sender) smtp.mailfrom=neilb@suse.de
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15]) (Using TLS) by
	relay.mimecast.com with ESMTP id us-mta-6-vvNic1ZUONi8nm0ge1elQA-1;
	Mon, 11 May 2020 18:38:23 -0400
X-MC-Unique: vvNic1ZUONi8nm0ge1elQA-1
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
	by mx2.suse.de (Postfix) with ESMTP id 39062AD89;
	Mon, 11 May 2020 22:38:23 +0000 (UTC)
From: NeilBrown <neilb@suse.de>
To: David Howells <dhowells@redhat.com>, torvalds@linux-foundation.org,
	Trond Myklebust <trond.myklebust@hammerspace.com>
Date: Tue, 12 May 2020 08:38:10 +1000
In-Reply-To: <158897619675.1119820.2203023452686054109.stgit@warthog.procyon.org.uk>
References: <158897619675.1119820.2203023452686054109.stgit@warthog.procyon.org.uk>
Message-ID: <87ftc6ayi5.fsf@notabene.neil.brown.name>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com; dkim=none; dmarc=none;
	spf=pass (relay.mimecast.com: domain of neilb@suse.de
	designates 195.135.220.15 as permitted sender)
	smtp.mailfrom=neilb@suse.de
X-Mimecast-Spam-Score: 0
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-loop: linux-cachefs@redhat.com
Cc: linux-nfs@vger.kernel.org, Lei Xue <carmark.dlut@gmail.com>,
	Carlos Maiolino <cmaiolino@redhat.com>,
	linux-kernel@vger.kernel.org, linux-cachefs@redhat.com,
	linux-fsdevel@vger.kernel.org, Anna Schumaker <anna.schumaker@netapp.com>
Subject: Re: [Linux-cachefs] [PATCH 0/5] cachefiles, nfs: Fixes
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
Content-Type: multipart/mixed; boundary="===============9078318529905507370=="
Sender: linux-cachefs-bounces@redhat.com
Errors-To: linux-cachefs-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16

--===============9078318529905507370==
Content-Type: multipart/signed; boundary="=-=-=";
	micalg=pgp-sha256; protocol="application/pgp-signature"

--=-=-=
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

On Fri, May 08 2020, David Howells wrote:

> Hi Linus, Trond, Anna,
>
> Can you pull these fixes for cachefiles and NFS's use of fscache?  Should
> they go through the NFS tree or directly upstream?  The things fixed are:

hi David,
thanks for these fscache fixes.  Here is another for your consideration.

NeilBrown


From: NeilBrown <neilb@suse.de>
Date: Tue, 12 May 2020 08:32:25 +1000
Subject: [PATCH] cachefiles: fix inverted ASSERTion.

bmap() returns a negative result precisely when a_ops->bmap is NULL.

A recent patch converted

       ASSERT(inode->i_mapping->a_ops->bmap);

to an assertion that bmap(inode, ...) returns a negative number.
This inverts the sense of the assertion.
So change it back : ASSERT(ret =3D=3D 0)

Fixes: 10d83e11a582 ("cachefiles: drop direct usage of ->bmap method.")
Signed-off-by: NeilBrown <neilb@suse.de>
---
 fs/cachefiles/rdwr.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/cachefiles/rdwr.c b/fs/cachefiles/rdwr.c
index 1dc97f2d6201..a4573c96660c 100644
--- a/fs/cachefiles/rdwr.c
+++ b/fs/cachefiles/rdwr.c
@@ -431,7 +431,7 @@ int cachefiles_read_or_alloc_page(struct fscache_retrie=
val *op,
 =09block <<=3D shift;
=20
 =09ret =3D bmap(inode, &block);
-=09ASSERT(ret < 0);
+=09ASSERT(ret =3D=3D 0);
=20
 =09_debug("%llx -> %llx",
 =09       (unsigned long long) (page->index << shift),
--=20
2.26.2


--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEG8Yp69OQ2HB7X0l6Oeye3VZigbkFAl6509IACgkQOeye3VZi
gbnDKQ/+MIO9eK9pP/A6zoofl4dfmmO2wUUM1+DX2Oh1H/8wxdkOM3q9WtX9xL7N
F3e7t1v3nGngJ0UqlXbO/Xu7j6dGCvj/m/nO1+1QlViPF5w0wYw+BJSr5fV/sXh+
ZOxnNEZTyoj8/xjc+5h76a8tuwV0XKbKfGvkZ+AVH8E3YqMhGuAj/5E+oGoA0ida
cCBs1rSWMXtYbcDAGcV6CoI4lHqMg62UPeX6fLush5nxDVu9wmQ3Gc0pSZ7lPNif
nA3e363xgE4BVpZOnc9NEKfnBa+dRKFed6Br+K+kGvaFhao7ntVePSaKW6R/S7gJ
H+yJpA5kAObGKsdF0KLHOFNeVZF+HfY4E/47Mwqboua5+1Y+REMnUa1TyYqK+TT3
c9jI4MpaJFOLWBsR8t+NVCcEpJSpoKoK2zp2UL+r9/LCwCuUOIjxV92D9BCnwPLT
QSG7pqfuHOnHkqugpjuQexljB+cYiklY+1KS6hxFNuktzL4i76EfISwj3wDRUHKd
PpIUmelidrqdo9YX9y/hxbhTFjxzJNhvVLRqDHjKTEaPTDdT68U3gqlJdbLl25NM
laUoAvufTQHsgNfTD1FKEVy2rsYkvJSOSRhP8OTykmLmGaAihgJhlnd4/O0uynqP
1OD3A8TD1oaCQOW2Y6uShEwcnd57Omhvj6Cvl26MwcIWXbx0KV4=
=shc0
-----END PGP SIGNATURE-----
--=-=-=--


--===============9078318529905507370==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://www.redhat.com/mailman/listinfo/linux-cachefs
--===============9078318529905507370==--

