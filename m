Return-Path: <linux-cachefs-bounces@listman.redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-44.mimecast.com (us-smtp-delivery-44.mimecast.com [205.139.111.44])
	by mail.lfdr.de (Postfix) with ESMTP id 227EE31D9D0
	for <lists+linux-cachefs@lfdr.de>; Wed, 17 Feb 2021 13:59:08 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-432-aYDu9PKfMCeLIIfGzUqB1Q-1; Wed, 17 Feb 2021 07:59:03 -0500
X-MC-Unique: aYDu9PKfMCeLIIfGzUqB1Q-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8F8E619611A5;
	Wed, 17 Feb 2021 12:59:01 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7DB0160C5F;
	Wed, 17 Feb 2021 12:59:01 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 98E0618095CB;
	Wed, 17 Feb 2021 12:58:58 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 11HCwtC1022552 for <linux-cachefs@listman.util.phx.redhat.com>;
	Wed, 17 Feb 2021 07:58:55 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id E5A87FED2C; Wed, 17 Feb 2021 12:58:54 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id DD31F9D47D
	for <linux-cachefs@redhat.com>; Wed, 17 Feb 2021 12:58:53 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B8052803FF9
	for <linux-cachefs@redhat.com>; Wed, 17 Feb 2021 12:58:53 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99]) (Using TLS)
	by relay.mimecast.com with ESMTP id us-mta-21-RXt93CHxPGamItcK41BFFw-1; 
	Wed, 17 Feb 2021 07:58:51 -0500
X-MC-Unique: RXt93CHxPGamItcK41BFFw-1
Received: by mail.kernel.org (Postfix) with ESMTPSA id 0171564E58;
	Wed, 17 Feb 2021 12:58:48 +0000 (UTC)
From: Jeff Layton <jlayton@kernel.org>
To: dhowells@redhat.com, idryomov@gmail.com
Date: Wed, 17 Feb 2021 07:58:41 -0500
Message-Id: <20210217125845.10319-3-jlayton@kernel.org>
In-Reply-To: <20210217125845.10319-1-jlayton@kernel.org>
References: <20210217125845.10319-1-jlayton@kernel.org>
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 11HCwtC1022552
X-loop: linux-cachefs@redhat.com
Cc: linux-fsdevel@vger.kernel.org, linux-cachefs@redhat.com,
	ceph-devel@vger.kernel.org
Subject: [Linux-cachefs] [PATCH v2 2/6] ceph: rework PageFsCache handling
X-BeenThere: linux-cachefs@listman.redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
List-Id: Linux filesystem caching discussion list
	<linux-cachefs.listman.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/linux-cachefs>, 
	<mailto:linux-cachefs-request@listman.redhat.com?subject=unsubscribe>
List-Archive: <https://listman.redhat.com/archives/linux-cachefs>
List-Post: <mailto:linux-cachefs@listman.redhat.com>
List-Help: <mailto:linux-cachefs-request@listman.redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/linux-cachefs>,
	<mailto:linux-cachefs-request@listman.redhat.com?subject=subscribe>
Sender: linux-cachefs-bounces@listman.redhat.com
Errors-To: linux-cachefs-bounces@listman.redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@listman.redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: listman.redhat.com
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable

With the new fscache API, the PageFsCache bit now indicates that the
page is being written to the cache and shouldn't be modified or released
until it's finished.

Change releasepage and invalidatepage to wait on that bit before
returning.

Also define FSCACHE_USE_NEW_IO_API so that we opt into the new fscache
API.

Signed-off-by: Jeff Layton <jlayton@kernel.org>
Cc: ceph-devel@vger.kernel.org
Cc: linux-cachefs@redhat.com
Cc: linux-fsdevel@vger.kernel.org
---
 fs/ceph/addr.c  | 9 ++++++++-
 fs/ceph/super.h | 1 +
 2 files changed, 9 insertions(+), 1 deletion(-)

diff --git a/fs/ceph/addr.c b/fs/ceph/addr.c
index 2b17bb36e548..fbfa49db06fd 100644
--- a/fs/ceph/addr.c
+++ b/fs/ceph/addr.c
@@ -146,6 +146,8 @@ static void ceph_invalidatepage(struct page *page, unsi=
gned int offset,
 =09struct ceph_inode_info *ci;
 =09struct ceph_snap_context *snapc =3D page_snap_context(page);
=20
+=09wait_on_page_fscache(page);
+
 =09inode =3D page->mapping->host;
 =09ci =3D ceph_inode(inode);
=20
@@ -168,11 +170,16 @@ static void ceph_invalidatepage(struct page *page, un=
signed int offset,
 =09ClearPagePrivate(page);
 }
=20
-static int ceph_releasepage(struct page *page, gfp_t g)
+static int ceph_releasepage(struct page *page, gfp_t gfp_flags)
 {
 =09dout("%p releasepage %p idx %lu (%sdirty)\n", page->mapping->host,
 =09     page, page->index, PageDirty(page) ? "" : "not ");
=20
+=09if (PageFsCache(page)) {
+=09=09if (!(gfp_flags & __GFP_DIRECT_RECLAIM) || !(gfp_flags & __GFP_FS))
+=09=09=09return 0;
+=09=09wait_on_page_fscache(page);
+=09}
 =09return !PagePrivate(page);
 }
=20
diff --git a/fs/ceph/super.h b/fs/ceph/super.h
index b62d8fee3b86..96bd3487d788 100644
--- a/fs/ceph/super.h
+++ b/fs/ceph/super.h
@@ -21,6 +21,7 @@
 #include <linux/ceph/libceph.h>
=20
 #ifdef CONFIG_CEPH_FSCACHE
+#define FSCACHE_USE_NEW_IO_API
 #include <linux/fscache.h>
 #endif
=20
--=20
2.29.2


--
Linux-cachefs mailing list
Linux-cachefs@listman.redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

