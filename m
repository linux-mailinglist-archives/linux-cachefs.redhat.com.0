Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A06045E8EE
	for <lists+linux-cachefs@lfdr.de>; Fri, 26 Nov 2021 09:00:23 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-532-e3W23s9LN1-Wov1oM6mkVg-1; Fri, 26 Nov 2021 03:00:19 -0500
X-MC-Unique: e3W23s9LN1-Wov1oM6mkVg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A8AA3613B5;
	Fri, 26 Nov 2021 08:00:15 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7C527794A3;
	Fri, 26 Nov 2021 08:00:14 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id CEE934BB7B;
	Fri, 26 Nov 2021 08:00:08 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 1AQ7uXX2020777 for <linux-cachefs@listman.util.phx.redhat.com>;
	Fri, 26 Nov 2021 02:56:34 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 3D94F2026D46; Fri, 26 Nov 2021 07:56:33 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 380302026D5D
	for <linux-cachefs@redhat.com>; Fri, 26 Nov 2021 07:56:29 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8C1C0811E86
	for <linux-cachefs@redhat.com>; Fri, 26 Nov 2021 07:56:29 +0000 (UTC)
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
	d=dkim.mimecast.com; s=201903; t=1637913389;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	to:to:cc:mime-version:mime-version:content-type:content-type:
	in-reply-to:in-reply-to:references:references;
	bh=Ew+14dlfaPxpSfiNMjjvVLEYOVVhJAZclXUeWD6hH7k=;
	b=h4BoUTPtFsRR0IPjdt05jorRx193yWppYDAbhTCku174BAW0kIo91R0Tu3+e1XOkYGuo87
	+gM1WB/epYNK52gqs+JSzT25qe0JOYgTe44wcboWNf5elWzltZqlv1P+Ovs7MLLSEsnlBT
	oAHuXnnbu/ZN0ZpXgWcpvychdxUBfaRhaNynsipe1minGGdN0rkMfdWAihOzv4pMKUL2GC
	eTa2SftR8idJM/kyGgHRvYADxy6PTg/2xCZU12QTooH0FkjKwhgWEwyQBbSBZU71gKHmT2
	UXPobJ0qUdUJ3xUrUFW/vFqMl2ddXm2Jk/VB/ZX7oDE7OQnfEcI14YNMCmkWyg==
ARC-Seal: i=1; s=201903; d=dkim.mimecast.com; t=1637913389; a=rsa-sha256;
	cv=none;
	b=EBNzicIMalQPD90DFa56uxQBqnV7KqBT9S271mDg2MYfwk3C6AhBbu8GUvjqtpKBT4ENlo
	TQE8Ea7i40AdAi9DVrvg0BtNYgs2i2uP8nPVnaEkySqXzGZXDUPnCz0ANFjpVGRyyIN1ts
	hrtpyZwvRcG+sfFuUuaQJbEFSrVLYncCQqmUIZoD+Vs904lLYsSCbzHV6OT1cdi/J82EII
	V7sX6DFya59Py7f0TSRlssVwxVsVynzslQspVFGjIVTz3y+np7RC+V6yl+paa/QeppsRpS
	xiv4T5Szj1Q+XueinQaCD/Sll/94Wyg7k5I24+Jh4c4Q91blcyTnLrK3WHkoJw==
ARC-Authentication-Results: i=1; relay.mimecast.com; dkim=none;
	dmarc=pass (policy=none) header.from=fjasle.eu;
	spf=pass (relay.mimecast.com: domain of nicolas@fjasle.eu designates
	212.227.126.133 as permitted sender)
	smtp.mailfrom=nicolas@fjasle.eu
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.133])
	by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	us-mta-329-T9e8jEIbOB2KU29K_uz_nA-1; Fri, 26 Nov 2021 02:56:25 -0500
X-MC-Unique: T9e8jEIbOB2KU29K_uz_nA-1
Received: from leknes.fjasle.eu ([92.116.70.26]) by mrelayeu.kundenserver.de
	(mreue011 [212.227.15.167]) with ESMTPSA (Nemesis) id
	1MmDZI-1m8Plh47uK-00iFvg; Fri, 26 Nov 2021 08:48:02 +0100
Received: from lillesand.fjasle.eu (unknown [IPv6:fd00::eadf:70ff:fe12:9041])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest
	SHA256 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "lillesand.fjasle.eu",
	Issuer "Fake LE Intermediate X1" (not verified))
	by leknes.fjasle.eu (Postfix) with ESMTPS id A8FC13C57D;
	Fri, 26 Nov 2021 08:48:00 +0100 (CET)
Received: by lillesand.fjasle.eu (Postfix, from userid 1000)
	id D142A106F1B; Fri, 26 Nov 2021 08:47:59 +0100 (CET)
Date: Fri, 26 Nov 2021 08:47:59 +0100
From: Nicolas Schier <nicolas@fjasle.eu>
To: David Howells <dhowells@redhat.com>, linux-cachefs@redhat.com,
	linux-kernel@vger.kernel.org
Message-ID: <YaCRLx0/CvrxqlZM@lillesand.fjasle.eu>
References: <YTX02eiVawkpTquX@fjasle.eu>
MIME-Version: 1.0
In-Reply-To: <YTX02eiVawkpTquX@fjasle.eu>
X-Operating-System: Debian GNU/Linux bookworm/sid
Jabber-ID: nicolas@jabber.no
X-Provags-ID: V03:K1:ZtYkmr9w5hy014mLoecCecpDJ1YoEVbGE/AMW5XS4wxcswZPp1l
	YEvzU84XphZgM4rbLtzWqJ1dt91uWo8jFrvH5PhPcWhsFXs0xv96LeEvbtg9WFl/KMPzHwk
	04vE0t5oa2n5BH2YgFjFlr+pl6SCN3isbiB4vtqs5UMTkEQUr6JtjWNxlewVQlJ0q4zEn/A
	AdCNXZafMAG8xord9rj1w==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:hr1Q2KS0wJQ=:wxYsg5oX2ZyDZtyEmpEEUf
	XD6nIlY/KWxQ8Vt5W4FUieDk6YIFZBiWw88bc9JKvjtTKoAAZRSU7yt096rEIOuike0qn8EP+
	vZsTH2+WVAuiZ1dz8+W6JIQYX7Nidfs3H4Fy6nz8eIUizVUwjjTYcnde/V5Cei/P1asVFGoSH
	JhQlMEmuCkKVjhpnSNmautxP+OtF48KBhL9+QHcUqqiF3F2Ve/jEssaeJ7gnuR4X/ZPpjuLpS
	yDl0IJC62BiVe0ummIrsZwcoaa+vN2eGXGir8luB/aFTcXhYxtILzJwZcoRVDjFNPBHDQO6I1
	K6YylgAiwJ++x2N6cBoQUeSaGC+S7XX2Yt1VTm3MHGq13DIRZ4bXQCFq2vjzwPTYna/1orUpT
	9UxArSYUQCvESik4h4oh44YdreHkNTZDNwCZfWxMDWnhpGRPnx69KeXnwMoh757Pe1KXwQOQk
	E6hHI1oPoNQ3my/Py28UgFiyHtqcRgY2+yH+LCCF3kfKCL5xb8tHcBPYiycEiG5V20P/epdIy
	75uTPJV/IjlPXymiA6XxVUxOHQEr5AHacUxH6v7UzmBGuP4El02hjf8TCru8XW+ePktGraA82
	JcfL70OthfOFIcV1zWhr+DdnAz/n81vf6FspTMQUXTrgkWVVi3CPPZ7oXvUwTakKiuOasIG7M
	Mcp3RoNBgTo5VnsSWDsDKHeZxOSAcGHzZbbTW/iH5Neubl8lTW9pSGDrKsLUKdpUvuzY=
Authentication-Results: relay.mimecast.com; dkim=none;
	dmarc=pass (policy=none) header.from=fjasle.eu;
	spf=pass (relay.mimecast.com: domain of nicolas@fjasle.eu designates
	212.227.126.133 as permitted sender)
	smtp.mailfrom=nicolas@fjasle.eu
X-Mimecast-Spam-Score: -1
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-loop: linux-cachefs@redhat.com
Subject: Re: [Linux-cachefs] [PATCH] [RESEND] fscache: re-match
 MODULE_PARM_DESC() calls to module parameters
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
Content-Type: multipart/mixed; boundary="===============6580449395694765414=="
Sender: linux-cachefs-bounces@redhat.com
Errors-To: linux-cachefs-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16

--===============6580449395694765414==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="tephn8Z5lGDb1jFQ"
Content-Disposition: inline

--tephn8Z5lGDb1jFQ
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon Sep  6 13:00:41 2021 Nicolas Schier wrote:
> Fix calls of MODULE_PARM_DESC() such that the first argument matches=20
> the
> actual module parameter name.  This changes the 'parm' section in the
> output of `modinfo fscache` from:
>=20
>     parm: defer_lookup:uint
>     parm: fscache_defer_lookup:Defer cookie lookup to background thread
>     parm: defer_create:uint
>     parm: fscache_defer_create:Defer cookie creation to background thread
>     parm: debug:uint
>     parm: fscache_debug:FS-Cache debugging mask
>=20
> into:
>=20
>     parm: defer_lookup:Defer cookie lookup to background thread (uint)
>     parm: defer_create:Defer cookie creation to background thread (uint)
>     parm: debug:FS-Cache debugging mask (uint)
> .
>=20
> Signed-off-by: Nicolas Schier <nicolas@fjasle.eu>
> ---
>  fs/fscache/main.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>=20
> --
> Resend unmodified as list approval for linux-cachefs@r.c timed out.
>=20
> diff --git a/fs/fscache/main.c b/fs/fscache/main.c
> index c1e6cc9091aa..ccb06dc0a6e9 100644
> --- a/fs/fscache/main.c
> +++ b/fs/fscache/main.c
> @@ -22,19 +22,19 @@ MODULE_LICENSE("GPL");
>  unsigned fscache_defer_lookup =3D 1;
>  module_param_named(defer_lookup, fscache_defer_lookup, uint,
>  =09=09   S_IWUSR | S_IRUGO);
> -MODULE_PARM_DESC(fscache_defer_lookup,
> +MODULE_PARM_DESC(defer_lookup,
>  =09=09 "Defer cookie lookup to background thread");
> =20
>  unsigned fscache_defer_create =3D 1;
>  module_param_named(defer_create, fscache_defer_create, uint,
>  =09=09   S_IWUSR | S_IRUGO);
> -MODULE_PARM_DESC(fscache_defer_create,
> +MODULE_PARM_DESC(defer_create,
>  =09=09 "Defer cookie creation to background thread");
> =20
>  unsigned fscache_debug;
>  module_param_named(debug, fscache_debug, uint,
>  =09=09   S_IWUSR | S_IRUGO);
> -MODULE_PARM_DESC(fscache_debug,
> +MODULE_PARM_DESC(debug,
>  =09=09 "FS-Cache debugging mask");
> =20
>  struct kobject *fscache_root;
> --=20
> 2.30.1

David,  I got no feedback on this here, yet.  Shall I fix something or=20
is there anything wrong with the patch? =20

Kind regards,
Nicolas

--tephn8Z5lGDb1jFQ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEh0E3p4c3JKeBvsLGB1IKcBYmEmkFAmGgkS8ACgkQB1IKcBYm
EmkV4hAAgsK+KGS+gHIn+QYzN4RY4hNVUo2dIX6990kgZQhiuJr0Ut7WbOUwOEw3
JeazkIu2S77G3G6kE2weUfeFft3dS+C6BqYI9GbmRWCTfPeUlg1PUq4/WIIfIC5V
Anln4x1Jzyx4ZLMPAevtHkIUvmN+57joAcksdX4GWblcvLUjELD9zccoY67oLcyG
oPX3jtUK8/eUTcltWo+lcWFPaMv/7Aa9pN3CNtZacseVUnlYuQ53QYz7ZK6PqcZe
NYRCCFZZvxAGf8AfGaieH/T/e2CU/FLuD3D3LFAj6uYfC1sQQO0ErQMLr1sJlu2H
i+Bjw6NDtS9WLFOrI0w+MZwa6fT3SRPq7MLOVlC7q9jFjVOR/tBZcpxoZLYH9gdV
ApZlSXBghkZqkRaOX2GzdfruS2ZpJusL2dSyoL9JiawdxbUi91VPL5J+TtovBetx
NZfVnLw2brdhQYj8TbEyJI1j8YB9wyVz+L1IxpeJH0e2bpB0EnPS9zBzVquCN2UV
KEcijQK31vUJyRCC31YZRh1tC2dVLUs8UKxLMAvaepZI/WY0wbS/YYMoh1pHFQ1t
1ZjzxDHg3ua1ck9t51nt2nyBxOBWFZdlEXjJdM5dhySaEutWsvW2Yn21IRJe5Sns
NRvzm+iQ2mGambLVkvKMeOI+HnkoJIxNWxCN2IXCbQI1kZC34r4=
=u7j8
-----END PGP SIGNATURE-----

--tephn8Z5lGDb1jFQ--


--===============6580449395694765414==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs
--===============6580449395694765414==--

