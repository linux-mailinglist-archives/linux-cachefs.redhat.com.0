Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 0763E2BBB5F
	for <lists+linux-cachefs@lfdr.de>; Sat, 21 Nov 2020 02:02:16 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1605920536;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=YmNp2GnlbyOm1tXATTIhAbI9Z8dIJvOXkr3ACSWdVP0=;
	b=bBneccXdorLzC/Y4xNAftb7q7w2z8JxPi08KJ7SdyAvoV/CAfB70nOh3iIoWhTNVf1UDeR
	mRh5iBdhgPlb+9oHvE1wCAp81/FUPXvRV6c2AIEN2mgizWBL3qOoyuvUR6Kpks/I/HQhGs
	9uedj8TGt1IU+FRoMlrSdU6Lt8b4A7U=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-591-fyj18rFOPKeBLGjZGpJKEQ-1; Fri, 20 Nov 2020 20:02:14 -0500
X-MC-Unique: fyj18rFOPKeBLGjZGpJKEQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A1A0B1DDEF;
	Sat, 21 Nov 2020 01:02:11 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8FD0B10016DB;
	Sat, 21 Nov 2020 01:02:11 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 5386C5002C;
	Sat, 21 Nov 2020 01:02:11 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0AL11YVD004577 for <linux-cachefs@listman.util.phx.redhat.com>;
	Fri, 20 Nov 2020 20:01:34 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 7B3C26085A; Sat, 21 Nov 2020 01:01:34 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from pick.fieldses.org (ovpn-113-103.rdu2.redhat.com [10.10.113.103])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4CDBC60853;
	Sat, 21 Nov 2020 01:01:29 +0000 (UTC)
Received: by pick.fieldses.org (Postfix, from userid 2815)
	id 6559F12033D; Fri, 20 Nov 2020 20:01:28 -0500 (EST)
Date: Fri, 20 Nov 2020 20:01:28 -0500
From: "J. Bruce Fields" <bfields@redhat.com>
To: Jeff Layton <jlayton@kernel.org>
Message-ID: <20201121010128.GK136478@pick.fieldses.org>
References: <20201120223831.GB7705@fieldses.org>
	<1605911960-12516-1-git-send-email-bfields@redhat.com>
	<1605911960-12516-6-git-send-email-bfields@redhat.com>
	<6c2bb6ae1ad586d6bf369afe561b77b271cd2ac8.camel@kernel.org>
MIME-Version: 1.0
In-Reply-To: <6c2bb6ae1ad586d6bf369afe561b77b271cd2ac8.camel@kernel.org>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-loop: linux-cachefs@redhat.com
Cc: Daire Byrne <daire@dneg.com>, linux-cachefs <linux-cachefs@redhat.com>,
	linux-nfs <linux-nfs@vger.kernel.org>,
	Trond Myklebust <trondmy@hammerspace.com>
Subject: Re: [Linux-cachefs] [PATCH 6/8] nfsd: move change attribute
	generation to filesystem
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
Sender: linux-cachefs-bounces@redhat.com
Errors-To: linux-cachefs-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 20, 2020 at 07:58:38PM -0500, Jeff Layton wrote:
> On Fri, 2020-11-20 at 17:39 -0500, J. Bruce Fields wrote:
> > diff --git a/fs/xfs/xfs_export.c b/fs/xfs/xfs_export.c
> > index 465fd9e048d4..b950fac3d7df 100644
> > --- a/fs/xfs/xfs_export.c
> > +++ b/fs/xfs/xfs_export.c
> > @@ -16,6 +16,7 @@
> > =A0#include "xfs_inode_item.h"
> > =A0#include "xfs_icache.h"
> > =A0#include "xfs_pnfs.h"
> > +#include <linux/iversion.h>
> > =A0
> >=20
> >=20
> >=20
> > =A0/*
> > =A0=A0* Note that we only accept fileids which are long enough rather t=
han allow
> > @@ -234,4 +235,5 @@ const struct export_operations xfs_export_operation=
s =3D {
> > =A0=09.map_blocks=09=09=3D xfs_fs_map_blocks,
> > =A0=09.commit_blocks=09=09=3D xfs_fs_commit_blocks,
> > =A0#endif
> > +=09.fetch_iversion=09=09=3D generic_fetch_iversion,
> > =A0};
>=20
> It seems a little weird to call a static inline here. I imagine that
> means the compiler has to add a duplicate inline in every .o file that
> does this? It may be cleaner to move generic_fetch_iversion into
> fs/libfs.c so we only have one copy of it.

OK.

(To be honest, I was a little suprised this worked.)

--b.

>=20
> > diff --git a/include/linux/iversion.h b/include/linux/iversion.h
> > index 3bfebde5a1a6..ded74523c8a6 100644
> > --- a/include/linux/iversion.h
> > +++ b/include/linux/iversion.h
> > @@ -328,6 +328,32 @@ inode_query_iversion(struct inode *inode)
> > =A0=09return cur >> I_VERSION_QUERIED_SHIFT;
> > =A0}
> > =A0
> >=20
> >=20
> >=20
> > +/*
> > + * We could use i_version alone as the NFSv4 change attribute.  Howeve=
r,
> > + * i_version can go backwards after a reboot.  On its own that doesn't
> > + * necessarily cause a problem, but if i_version goes backwards and th=
en
> > + * is incremented again it could reuse a value that was previously use=
d
> > + * before boot, and a client who queried the two values might
> > + * incorrectly assume nothing changed.
> > + *
> > + * By using both ctime and the i_version counter we guarantee that as
> > + * long as time doesn't go backwards we never reuse an old value.
> > + *
> > + * A filesystem that has an on-disk boot counter or similar might pref=
er
> > + * to use that to avoid the risk of the change attribute going backwar=
ds
> > + * if system time is set backwards.
> > + */
> > +static inline u64 generic_fetch_iversion(struct inode *inode)
> > +{
> > +=09u64 chattr;
> > +
> > +=09chattr =3D  inode->i_ctime.tv_sec;
> > +=09chattr <<=3D 30;
> > +=09chattr +=3D inode->i_ctime.tv_nsec;
> > +=09chattr +=3D inode_query_iversion(inode);
> > +=09return chattr;
> > +}
> > +
> > =A0/*
> > =A0=A0* For filesystems without any sort of change attribute, the best =
we can
> > =A0=A0* do is fake one up from the ctime:
>=20
> --=20
> Jeff Layton <jlayton@kernel.org>
>=20

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://www.redhat.com/mailman/listinfo/linux-cachefs

