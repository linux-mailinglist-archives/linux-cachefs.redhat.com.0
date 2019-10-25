Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by mail.lfdr.de (Postfix) with ESMTP id 77E9EE4F68
	for <lists+linux-cachefs@lfdr.de>; Fri, 25 Oct 2019 16:43:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1572014597;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=HDP/fAPrBfZCVWRsZaHhPZCV6wV1qH4Xc22jSvSh4SI=;
	b=UwSwbes2faiNS5K6GZ6MXKkl4W8zEo66HGxfS4/A7Tu/AafXklKc6tFyoFJO0w8CgcZOST
	laeAaRM7upT4EtYX+I9X5g7yUZ3Y5ziSvdE9G0yOD7fcEg3claDBDA01ei/xwuU0CJBoB8
	OwWppKQQit3kCYC5G9K1YEc0kI3oelA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-396-sB9DiExiM4K394dJUdDavg-1; Fri, 25 Oct 2019 10:43:13 -0400
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DA5B75ED;
	Fri, 25 Oct 2019 14:43:10 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C2261194B6;
	Fri, 25 Oct 2019 14:43:10 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 429304E58A;
	Fri, 25 Oct 2019 14:43:10 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x9PCIqFS030187 for <linux-cachefs@listman.util.phx.redhat.com>;
	Fri, 25 Oct 2019 08:18:52 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id DE29A3CCA; Fri, 25 Oct 2019 12:18:52 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mx1.redhat.com (ext-mx18.extmail.prod.ext.phx2.redhat.com
	[10.5.110.47])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6CD8557B6;
	Fri, 25 Oct 2019 12:18:50 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id C1163308212D;
	Fri, 25 Oct 2019 12:18:49 +0000 (UTC)
Received: from tleilax.poochiereds.net
	(68-20-15-154.lightspeed.rlghnc.sbcglobal.net [68.20.15.154])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id 14AB221D71;
	Fri, 25 Oct 2019 12:18:49 +0000 (UTC)
From: Jeff Layton <jlayton@kernel.org>
To: dhowells@redhat.com
Date: Fri, 25 Oct 2019 08:18:46 -0400
Message-Id: <20191025121847.24739-2-jlayton@kernel.org>
In-Reply-To: <20191025121847.24739-1-jlayton@kernel.org>
References: <20191025121847.24739-1-jlayton@kernel.org>
MIME-Version: 1.0
X-Greylist: Sender DNS name whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.47]);
	Fri, 25 Oct 2019 12:18:49 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.47]);
	Fri, 25 Oct 2019 12:18:49 +0000 (UTC) for IP:'198.145.29.99'
	DOMAIN:'mail.kernel.org' HELO:'mail.kernel.org'
	FROM:'jlayton@kernel.org' RCPT:''
X-RedHat-Spam-Score: -5.101  (DKIMWL_WL_HIGH, DKIM_SIGNED, DKIM_VALID,
	DKIM_VALID_AU, RCVD_IN_DNSWL_HI, SPF_HELO_NONE,
	SPF_PASS) 198.145.29.99 mail.kernel.org 198.145.29.99 mail.kernel.org
	<jlayton@kernel.org>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.47
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-loop: linux-cachefs@redhat.com
X-Mailman-Approved-At: Fri, 25 Oct 2019 10:43:01 -0400
Cc: linux-cachefs@redhat.com
Subject: [Linux-cachefs] [PATCH 2/3] fscache: new osm state for handling
	abort after parent is ready
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
X-MC-Unique: sB9DiExiM4K394dJUdDavg-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable

After basic initialization of an fscache object, the oob_table is set
to fscache_osm_init_oob. Eventually though, we'll wait on the parent to
be ready and at that point, fscache_osm_init_oob is not sufficient to
unwind the current state of the object.

Fix this by having fscache_parent_ready set the oob_table to a new
state that properly releases the parent and then transitions to the
ABORT_INIT state to finish the cleanup.

Signed-off-by: Jeff Layton <jlayton@kernel.org>
---
 fs/fscache/object.c | 24 +++++++++++++++++++++---
 1 file changed, 21 insertions(+), 3 deletions(-)

diff --git a/fs/fscache/object.c b/fs/fscache/object.c
index a42b206c0659..51f2991fed3f 100644
--- a/fs/fscache/object.c
+++ b/fs/fscache/object.c
@@ -15,6 +15,7 @@
 #include "internal.h"
=20
 static const struct fscache_state *fscache_abort_initialisation(struct fsc=
ache_object *, int);
+static const struct fscache_state *fscache_abort_parent(struct fscache_obj=
ect *, int);
 static const struct fscache_state *fscache_kill_dependents(struct fscache_=
object *, int);
 static const struct fscache_state *fscache_drop_object(struct fscache_obje=
ct *, int);
 static const struct fscache_state *fscache_initialise_object(struct fscach=
e_object *, int);
@@ -75,6 +76,7 @@ static const struct fscache_state *fscache_object_dead(st=
ruct fscache_object *,
  */
 static WORK_STATE(INIT_OBJECT,=09=09"INIT", fscache_initialise_object);
 static WORK_STATE(PARENT_READY,=09=09"PRDY", fscache_parent_ready);
+static WORK_STATE(ABORT_PARENT,=09=09"ABTP",=09fscache_abort_parent);
 static WORK_STATE(ABORT_INIT,=09=09"ABRT", fscache_abort_initialisation);
 static WORK_STATE(LOOK_UP_OBJECT,=09"LOOK", fscache_look_up_object);
 static WORK_STATE(CREATE_OBJECT,=09"CRTO", fscache_look_up_object);
@@ -120,6 +122,13 @@ static const struct fscache_transition fscache_osm_ini=
t_oob[] =3D {
 =09   { 0, NULL }
 };
=20
+static const struct fscache_transition fscache_osm_parent_oob[] =3D {
+=09   TRANSIT_TO(ABORT_PARENT,
+=09=09      (1 << FSCACHE_OBJECT_EV_ERROR) |
+=09=09      (1 << FSCACHE_OBJECT_EV_KILL)),
+=09   { 0, NULL }
+};
+
 static const struct fscache_transition fscache_osm_lookup_oob[] =3D {
 =09   TRANSIT_TO(LOOKUP_FAILURE,
 =09=09      (1 << FSCACHE_OBJECT_EV_ERROR) |
@@ -350,9 +359,7 @@ static inline void fscache_mark_object_dead(struct fsca=
che_object *object)
 =09spin_unlock(&object->lock);
 }
=20
-/*
- * Abort object initialisation before we start it.
- */
+/* Abort object initialisation before we start it. */
 static const struct fscache_state *fscache_abort_initialisation(struct fsc=
ache_object *object,
 =09=09=09=09=09=09=09=09int event)
 {
@@ -363,6 +370,15 @@ static const struct fscache_state *fscache_abort_initi=
alisation(struct fscache_o
 =09return transit_to(KILL_OBJECT);
 }
=20
+/* Abort object init after the parent is ready. */
+static const struct fscache_state *fscache_abort_parent(struct fscache_obj=
ect *object,
+=09=09=09=09=09=09=09=09int event)
+{
+=09_enter("{OBJ%x},%d", object->debug_id, event);
+=09fscache_done_parent_op(object);
+=09return transit_to(ABORT_INIT);
+}
+
 /*
  * initialise an object
  * - check the specified object's parent to see if we can make use of it
@@ -434,6 +450,8 @@ static const struct fscache_state *fscache_parent_ready=
(struct fscache_object *o
=20
 =09ASSERT(parent !=3D NULL);
=20
+=09object->oob_table =3D fscache_osm_parent_oob;
+
 =09spin_lock(&parent->lock);
 =09parent->n_ops++;
 =09parent->n_obj_ops++;
--=20
2.21.0

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://www.redhat.com/mailman/listinfo/linux-cachefs

