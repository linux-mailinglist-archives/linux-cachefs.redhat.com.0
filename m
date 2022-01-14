Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id C002D48EAC0
	for <lists+linux-cachefs@lfdr.de>; Fri, 14 Jan 2022 14:34:51 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-556-aFuD7qg-P2ik6kV0YLC9ag-1; Fri, 14 Jan 2022 08:34:47 -0500
X-MC-Unique: aFuD7qg-P2ik6kV0YLC9ag-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DA450835B8C;
	Fri, 14 Jan 2022 13:34:44 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 40EE06FB60;
	Fri, 14 Jan 2022 13:34:43 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 73123180BAD1;
	Fri, 14 Jan 2022 13:34:40 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
	[10.11.54.1])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 20EDYai0023846 for <linux-cachefs@listman.util.phx.redhat.com>;
	Fri, 14 Jan 2022 08:34:36 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 91DB840FF69B; Fri, 14 Jan 2022 13:34:36 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8D68540FF690
	for <linux-cachefs@redhat.com>; Fri, 14 Jan 2022 13:34:36 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 74915811E76
	for <linux-cachefs@redhat.com>; Fri, 14 Jan 2022 13:34:36 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org
	[139.178.84.217]) by relay.mimecast.com with ESMTP with STARTTLS
	(version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	us-mta-312-ryq__wF1P2OIPRg1ywttgQ-1; Fri, 14 Jan 2022 08:34:32 -0500
X-MC-Unique: ryq__wF1P2OIPRg1ywttgQ-1
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 2DD3E60AF5;
	Fri, 14 Jan 2022 13:34:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 51D02C36AE5;
	Fri, 14 Jan 2022 13:34:31 +0000 (UTC)
From: Jeff Layton <jlayton@kernel.org>
To: dhowells@redhat.com
Date: Fri, 14 Jan 2022 08:34:30 -0500
Message-Id: <20220114133430.177295-1-jlayton@kernel.org>
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 20EDYai0023846
X-loop: linux-cachefs@redhat.com
Cc: linux-cachefs@redhat.com
Subject: [Linux-cachefs] [PATCH] fscache: add fscache_cookie_state_dropped
	helper
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
Sender: linux-cachefs-bounces@redhat.com
Errors-To: linux-cachefs-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Signed-off-by: Jeff Layton <jlayton@kernel.org>
---
 fs/fscache/cookie.c | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/fs/fscache/cookie.c b/fs/fscache/cookie.c
index 9bb1ab5fe5ed..f9ebaaca5eb5 100644
--- a/fs/fscache/cookie.c
+++ b/fs/fscache/cookie.c
@@ -372,17 +372,22 @@ static struct fscache_cookie *fscache_alloc_cookie(
 	return NULL;
 }
 
+static inline bool fscache_cookie_state_dropped(enum fscache_cookie_state *statep)
+{
+	return READ_ONCE(*statep) == FSCACHE_COOKIE_STATE_DROPPED;
+}
+
 static void fscache_wait_on_collision(struct fscache_cookie *candidate,
 				      struct fscache_cookie *wait_for)
 {
 	enum fscache_cookie_state *statep = &wait_for->state;
 
-	wait_var_event_timeout(statep, READ_ONCE(*statep) == FSCACHE_COOKIE_STATE_DROPPED,
+	wait_var_event_timeout(statep, fscache_cookie_state_dropped(statep),
 			       20 * HZ);
-	if (READ_ONCE(*statep) != FSCACHE_COOKIE_STATE_DROPPED) {
+	if (!fscache_cookie_state_dropped(statep)) {
 		pr_notice("Potential collision c=%08x old: c=%08x",
 			  candidate->debug_id, wait_for->debug_id);
-		wait_var_event(statep, READ_ONCE(*statep) == FSCACHE_COOKIE_STATE_DROPPED);
+		wait_var_event(statep, fscache_cookie_state_dropped(statep));
 	}
 }
 
-- 
2.34.1


--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

