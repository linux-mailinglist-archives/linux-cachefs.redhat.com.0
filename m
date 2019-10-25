Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com [207.211.31.120])
	by mail.lfdr.de (Postfix) with ESMTP id E7AB1E4F6B
	for <lists+linux-cachefs@lfdr.de>; Fri, 25 Oct 2019 16:43:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1572014603;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=+wo3/axIjNNpynyNUMPDWX3jyMVOl4m41W+uknVjrP4=;
	b=Z4HfbOt/QtrITedewdUbizoddJ8zbbwI0Tb1cGWtHvf7o3VeJr+85C3VCevk5f8I0cXuel
	2m37ccHDYZUYwj7ngHkG9FX3znYA/j54u6e7wB+IBQAWoa3BnKYEAqHA3hNv6/Bh5f6Zyj
	j8EAoh+aM/A6Khsyff+bcC89bexMsd8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-41-lpcntE-CNIKdDyU38L9t7Q-1; Fri, 25 Oct 2019 10:43:13 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AA9031800E01;
	Fri, 25 Oct 2019 14:43:10 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 99CEE5C226;
	Fri, 25 Oct 2019 14:43:09 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 6741A4E589;
	Fri, 25 Oct 2019 14:43:05 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id x9PCIq1S030182 for <linux-cachefs@listman.util.phx.redhat.com>;
	Fri, 25 Oct 2019 08:18:52 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 5B0DD60BF3; Fri, 25 Oct 2019 12:18:52 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mx1.redhat.com (ext-mx16.extmail.prod.ext.phx2.redhat.com
	[10.5.110.45])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C6BCC60BE0;
	Fri, 25 Oct 2019 12:18:49 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 45AF13082A8B;
	Fri, 25 Oct 2019 12:18:49 +0000 (UTC)
Received: from tleilax.poochiereds.net
	(68-20-15-154.lightspeed.rlghnc.sbcglobal.net [68.20.15.154])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id 922312070B;
	Fri, 25 Oct 2019 12:18:48 +0000 (UTC)
From: Jeff Layton <jlayton@kernel.org>
To: dhowells@redhat.com
Date: Fri, 25 Oct 2019 08:18:45 -0400
Message-Id: <20191025121847.24739-1-jlayton@kernel.org>
MIME-Version: 1.0
X-Greylist: Sender DNS name whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.45]);
	Fri, 25 Oct 2019 12:18:49 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.45]);
	Fri, 25 Oct 2019 12:18:49 +0000 (UTC) for IP:'198.145.29.99'
	DOMAIN:'mail.kernel.org' HELO:'mail.kernel.org'
	FROM:'jlayton@kernel.org' RCPT:''
X-RedHat-Spam-Score: -5.101  (DKIMWL_WL_HIGH, DKIM_SIGNED, DKIM_VALID,
	DKIM_VALID_AU, RCVD_IN_DNSWL_HI, SPF_HELO_NONE,
	SPF_PASS) 198.145.29.99 mail.kernel.org 198.145.29.99 mail.kernel.org
	<jlayton@kernel.org>
X-Scanned-By: MIMEDefang 2.84 on 10.5.110.45
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-loop: linux-cachefs@redhat.com
X-Mailman-Approved-At: Fri, 25 Oct 2019 10:43:01 -0400
Cc: linux-cachefs@redhat.com
Subject: [Linux-cachefs] [PATCH 1/3] fscache: add tracepoints to
	fscache_parent_ready and fscache_done_parent_op
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-MC-Unique: lpcntE-CNIKdDyU38L9t7Q-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable

Add some tracepoints for tracking acquisition and release of parent
references.

Signed-off-by: Jeff Layton <jlayton@kernel.org>
---
 fs/fscache/object.c            |  2 ++
 include/trace/events/fscache.h | 29 +++++++++++++++++++++++++++++
 2 files changed, 31 insertions(+)

diff --git a/fs/fscache/object.c b/fs/fscache/object.c
index 3eac39ad3fae..a42b206c0659 100644
--- a/fs/fscache/object.c
+++ b/fs/fscache/object.c
@@ -156,6 +156,7 @@ static inline void fscache_done_parent_op(struct fscach=
e_object *object)
 =09spin_lock_nested(&parent->lock, 1);
 =09parent->n_obj_ops--;
 =09parent->n_ops--;
+=09trace_fscache_parent(object, true);
 =09if (parent->n_ops =3D=3D 0)
 =09=09fscache_raise_event(parent, FSCACHE_OBJECT_EV_CLEARED);
 =09spin_unlock(&parent->lock);
@@ -437,6 +438,7 @@ static const struct fscache_state *fscache_parent_ready=
(struct fscache_object *o
 =09parent->n_ops++;
 =09parent->n_obj_ops++;
 =09object->lookup_jif =3D jiffies;
+=09trace_fscache_parent(object, false);
 =09spin_unlock(&parent->lock);
=20
 =09_leave("");
diff --git a/include/trace/events/fscache.h b/include/trace/events/fscache.=
h
index dd2c794b5489..4c28aafcbb84 100644
--- a/include/trace/events/fscache.h
+++ b/include/trace/events/fscache.h
@@ -329,6 +329,35 @@ TRACE_EVENT(fscache_disable,
 =09=09      __entry->n_children, __entry->n_active, __entry->flags)
 =09    );
=20
+TRACE_EVENT(fscache_parent,
+=09    TP_PROTO(struct fscache_object *obj, bool done),
+
+=09    TP_ARGS(obj, done),
+
+=09    TP_STRUCT__entry(
+=09=09    __field(unsigned int,=09cookie=09   )
+=09=09    __field(unsigned int,=09parent=09   )
+=09=09    __field(int,=09=09n_obj_ops  )
+=09=09    __field(int,=09=09n_ops      )
+=09=09    __field(int,=09=09n_children )
+=09=09    __field(bool,=09=09done       )
+=09=09=09     ),
+
+=09    TP_fast_assign(
+=09=09    __entry->cookie=09=3D obj->cookie->debug_id;
+=09=09    __entry->parent=09=3D obj->parent->cookie->debug_id;
+=09=09    __entry->n_obj_ops=09=3D obj->parent->n_obj_ops;
+=09=09    __entry->n_ops=09=3D obj->parent->n_ops;
+=09=09    __entry->n_children=09=3D obj->parent->n_children;
+=09=09    __entry->done=09=3D done;
+=09=09=09   ),
+
+=09    TP_printk("c=3D%08x pc=3D%08x Noo=3D%d No=3D%d Nc=3D%d %s",
+=09=09      __entry->cookie, __entry->parent, __entry->n_obj_ops,
+=09=09      __entry->n_ops, __entry->n_children,
+=09=09      __entry->done ? "DONE" : "READY")
+=09    );
+
 TRACE_EVENT(fscache_osm,
 =09    TP_PROTO(struct fscache_object *object,
 =09=09     const struct fscache_state *state,
--=20
2.21.0

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://www.redhat.com/mailman/listinfo/linux-cachefs

