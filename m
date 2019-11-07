Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	by mail.lfdr.de (Postfix) with ESMTP id 67C06F37DE
	for <lists+linux-cachefs@lfdr.de>; Thu,  7 Nov 2019 20:04:37 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1573153475;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=HfXdAgJjDXgAe0DgjyjtGxCUiOuvQaY38eQPOVUmtdQ=;
	b=BiSLaBYhwXuA1+pjYQyBUjDSV5yDseQD9iJ/Kp3+SDPhS6kfs3++brKCf42iEHQDcn+cyH
	fEOMZ2oO58zqZv66Ts8Od4tR0PH/HESyZr2JfFMt6xRpk9HLsMTA28EYCQdSHMiR9tCzWP
	y+seHocksE9D8tkWFg9hwKF+ozc9lXk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-114-xdMD0J9bOS-rYp0ZGBNzdQ-1; Thu, 07 Nov 2019 14:04:29 -0500
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9C34B1005500;
	Thu,  7 Nov 2019 19:04:24 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 447F719757;
	Thu,  7 Nov 2019 19:04:23 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id F30044BB5C;
	Thu,  7 Nov 2019 19:04:18 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id xA7J4FD0012388 for <linux-cachefs@listman.util.phx.redhat.com>;
	Thu, 7 Nov 2019 14:04:15 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 2FA6060BFB; Thu,  7 Nov 2019 19:04:15 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mx1.redhat.com (ext-mx03.extmail.prod.ext.phx2.redhat.com
	[10.5.110.27])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6B97B60FC2;
	Thu,  7 Nov 2019 19:04:03 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 8740983F51;
	Thu,  7 Nov 2019 19:04:02 +0000 (UTC)
Received: from tleilax.com (68-20-15-154.lightspeed.rlghnc.sbcglobal.net
	[68.20.15.154])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id D4A5C21D6C;
	Thu,  7 Nov 2019 19:04:01 +0000 (UTC)
From: Jeff Layton <jlayton@kernel.org>
To: dhowells@redhat.com
Date: Thu,  7 Nov 2019 14:03:59 -0500
Message-Id: <20191107190359.212127-1-jlayton@kernel.org>
MIME-Version: 1.0
X-Greylist: Sender DNS name whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.27]);
	Thu, 07 Nov 2019 19:04:02 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.27]);
	Thu, 07 Nov 2019 19:04:02 +0000 (UTC) for IP:'198.145.29.99'
	DOMAIN:'mail.kernel.org' HELO:'mail.kernel.org'
	FROM:'jlayton@kernel.org' RCPT:''
X-RedHat-Spam-Score: -5.101  (DKIMWL_WL_HIGH, DKIM_SIGNED, DKIM_VALID,
	DKIM_VALID_AU, RCVD_IN_DNSWL_HI, SPF_HELO_NONE,
	SPF_PASS) 198.145.29.99 mail.kernel.org 198.145.29.99 mail.kernel.org
	<jlayton@kernel.org>
X-Scanned-By: MIMEDefang 2.78 on 10.5.110.27
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-loop: linux-cachefs@redhat.com
Cc: linux-cachefs@redhat.com
Subject: [Linux-cachefs] [PATCH] fscache: print usage count for objects in
	cache
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-MC-Unique: xdMD0J9bOS-rYp0ZGBNzdQ-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable

Have the fscache "objects" procfile also display the usage count for
the object to help track down refcounting issues.

Add a new object_usage operation that returns the value, add a new
field to the objects procfile and have fscache query it for the
object.

Signed-off-by: Jeff Layton <jlayton@kernel.org>
---
 fs/cachefiles/interface.c     | 12 ++++++++++++
 fs/fscache/object-list.c      |  9 +++++----
 include/linux/fscache-cache.h |  3 +++
 3 files changed, 20 insertions(+), 4 deletions(-)

diff --git a/fs/cachefiles/interface.c b/fs/cachefiles/interface.c
index f6ccf25604b1..732639c764f8 100644
--- a/fs/cachefiles/interface.c
+++ b/fs/cachefiles/interface.c
@@ -366,6 +366,17 @@ static void cachefiles_put_object(struct fscache_objec=
t *_object,
 =09_leave("");
 }
=20
+static int cachefiles_object_usage(struct fscache_object *_object)
+{
+=09struct cachefiles_object *object;
+
+=09ASSERT(_object);
+
+=09object =3D container_of(_object, struct cachefiles_object, fscache);
+=09return atomic_read(&object->usage);
+}
+
+
 /*
  * sync a cache
  */
@@ -554,6 +565,7 @@ const struct fscache_cache_ops cachefiles_cache_ops =3D=
 {
 =09.invalidate_object=09=3D cachefiles_invalidate_object,
 =09.drop_object=09=09=3D cachefiles_drop_object,
 =09.put_object=09=09=3D cachefiles_put_object,
+=09.object_usage=09=09=3D cachefiles_object_usage,
 =09.sync_cache=09=09=3D cachefiles_sync_cache,
 =09.attr_changed=09=09=3D cachefiles_attr_changed,
 =09.read_or_alloc_page=09=3D cachefiles_read_or_alloc_page,
diff --git a/fs/fscache/object-list.c b/fs/fscache/object-list.c
index a64a67778714..c3549358570e 100644
--- a/fs/fscache/object-list.c
+++ b/fs/fscache/object-list.c
@@ -168,7 +168,7 @@ static int fscache_objlist_show(struct seq_file *m, voi=
d *v)
=20
 =09if ((unsigned long) v =3D=3D 1) {
 =09=09seq_puts(m, "OBJECT   PARENT   STAT CHLDN OPS OOP IPR EX READS"
-=09=09=09 " EM EV FL S"
+=09=09=09 " EM EV FL S U"
 =09=09=09 " | COOKIE   NETFS_COOKIE_DEF TY FL NETFS_DATA");
 =09=09if (config & (FSCACHE_OBJLIST_CONFIG_KEY |
 =09=09=09      FSCACHE_OBJLIST_CONFIG_AUX))
@@ -187,7 +187,7 @@ static int fscache_objlist_show(struct seq_file *m, voi=
d *v)
=20
 =09if ((unsigned long) v =3D=3D 2) {
 =09=09seq_puts(m, "=3D=3D=3D=3D=3D=3D=3D=3D =3D=3D=3D=3D=3D=3D=3D=3D =3D=
=3D=3D=3D =3D=3D=3D=3D=3D =3D=3D=3D =3D=3D=3D =3D=3D=3D =3D=3D =3D=3D=3D=3D=
=3D"
-=09=09=09 " =3D=3D =3D=3D =3D=3D =3D"
+=09=09=09 " =3D=3D =3D=3D =3D=3D =3D =3D"
 =09=09=09 " | =3D=3D=3D=3D=3D=3D=3D=3D =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D =3D=3D =3D=3D=3D =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D");
 =09=09if (config & (FSCACHE_OBJLIST_CONFIG_KEY |
 =09=09=09      FSCACHE_OBJLIST_CONFIG_AUX))
@@ -230,7 +230,7 @@ static int fscache_objlist_show(struct seq_file *m, voi=
d *v)
 =09}
=20
 =09seq_printf(m,
-=09=09   "%08x %08x %s %5u %3u %3u %3u %2u %5u %2lx %2lx %2lx %1x | ",
+=09=09   "%08x %08x %s %5u %3u %3u %3u %2u %5u %2lx %2lx %2lx %1x %1x | ",
 =09=09   obj->debug_id,
 =09=09   obj->parent ? obj->parent->debug_id : UINT_MAX,
 =09=09   obj->state->short_name,
@@ -243,7 +243,8 @@ static int fscache_objlist_show(struct seq_file *m, voi=
d *v)
 =09=09   obj->event_mask,
 =09=09   obj->events,
 =09=09   obj->flags,
-=09=09   work_busy(&obj->work));
+=09=09   work_busy(&obj->work),
+=09=09   obj->cache->ops->object_usage(obj));
=20
 =09if (obj->cookie) {
 =09=09uint16_t keylen =3D 0, auxlen =3D 0;
diff --git a/include/linux/fscache-cache.h b/include/linux/fscache-cache.h
index 143b1594ac94..732b5a7e65c1 100644
--- a/include/linux/fscache-cache.h
+++ b/include/linux/fscache-cache.h
@@ -274,6 +274,9 @@ struct fscache_cache_ops {
 =09void (*put_object)(struct fscache_object *object,
 =09=09=09   enum fscache_obj_ref_trace why);
=20
+=09/* return current usage count of an object */
+=09int (*object_usage)(struct fscache_object *object);
+
 =09/* sync a cache */
 =09void (*sync_cache)(struct fscache_cache *cache);
=20
--=20
2.23.0

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://www.redhat.com/mailman/listinfo/linux-cachefs

