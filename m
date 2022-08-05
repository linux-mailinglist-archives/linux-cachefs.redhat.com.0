Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id BF21458A99B
	for <lists+linux-cachefs@lfdr.de>; Fri,  5 Aug 2022 12:44:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1659696239;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=bQNWLKRD9N2iyWbtc1QrEcHmrhbtkViytmE+t2GH17g=;
	b=QX7U5S45RgM257PsIqmDLJTMPfXFfP84VNkb6HgN1b+hsvVJi2XKUkPTmhNWOQM6s/DQe0
	So4/Xob0rbknamCEB2UqdqMdVg4zEf5pGEZw+j8jtW7kaMj6pjtusCnP8f/tH065m26bQO
	8O2geG/hnhGlGfFC1T29SqZ/F2rdkZU=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-571-DvsRwZiOM3q75F8mgf3pyA-1; Fri, 05 Aug 2022 06:43:57 -0400
X-MC-Unique: DvsRwZiOM3q75F8mgf3pyA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com [10.11.54.5])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2FFCB8001EA;
	Fri,  5 Aug 2022 10:43:56 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 260DB94571;
	Fri,  5 Aug 2022 10:43:56 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id DEA6F1946A63;
	Fri,  5 Aug 2022 10:43:55 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 35D121946A5F for <linux-cachefs@listman.corp.redhat.com>;
 Fri,  5 Aug 2022 10:43:54 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 07551C28125; Fri,  5 Aug 2022 10:43:54 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 03B5DC28100
 for <linux-cachefs@redhat.com>; Fri,  5 Aug 2022 10:43:54 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E110085A581
 for <linux-cachefs@redhat.com>; Fri,  5 Aug 2022 10:43:53 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [139.178.84.217]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-494-cUAL1MUrOPG71xbLVWFzUQ-1; Fri, 05 Aug 2022 06:43:52 -0400
X-MC-Unique: cUAL1MUrOPG71xbLVWFzUQ-1
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 492F661921;
 Fri,  5 Aug 2022 10:43:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 59539C433D6;
 Fri,  5 Aug 2022 10:43:50 +0000 (UTC)
From: Jeff Layton <jlayton@kernel.org>
To: dhowells@redhat.com
Date: Fri,  5 Aug 2022 06:43:48 -0400
Message-Id: <20220805104348.15006-1-jlayton@kernel.org>
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
Subject: [Linux-cachefs] [PATCH] fscache: add tracepoint when failing cookie
X-BeenThere: linux-cachefs@redhat.com
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux filesystem caching discussion list <linux-cachefs.redhat.com>
List-Unsubscribe: <https://listman.redhat.com/mailman/options/linux-cachefs>, 
 <mailto:linux-cachefs-request@redhat.com?subject=unsubscribe>
List-Archive: <http://listman.redhat.com/archives/linux-cachefs/>
List-Post: <mailto:linux-cachefs@redhat.com>
List-Help: <mailto:linux-cachefs-request@redhat.com?subject=help>
List-Subscribe: <https://listman.redhat.com/mailman/listinfo/linux-cachefs>,
 <mailto:linux-cachefs-request@redhat.com?subject=subscribe>
Cc: linux-cachefs@redhat.com
Errors-To: linux-cachefs-bounces@redhat.com
Sender: "Linux-cachefs" <linux-cachefs-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Signed-off-by: Jeff Layton <jlayton@kernel.org>
---
 fs/fscache/cookie.c            | 2 ++
 include/trace/events/fscache.h | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/fs/fscache/cookie.c b/fs/fscache/cookie.c
index 26a6d395737a..451d8a077e12 100644
--- a/fs/fscache/cookie.c
+++ b/fs/fscache/cookie.c
@@ -263,6 +263,8 @@ void fscache_caching_failed(struct fscache_cookie *cookie)
 {
 	clear_bit(FSCACHE_COOKIE_IS_CACHING, &cookie->flags);
 	fscache_set_cookie_state(cookie, FSCACHE_COOKIE_STATE_FAILED);
+	trace_fscache_cookie(cookie->debug_id, refcount_read(&cookie->ref),
+				fscache_cookie_failed);
 }
 EXPORT_SYMBOL(fscache_caching_failed);
 
diff --git a/include/trace/events/fscache.h b/include/trace/events/fscache.h
index cb3fb337e880..c078c48a8e6d 100644
--- a/include/trace/events/fscache.h
+++ b/include/trace/events/fscache.h
@@ -49,6 +49,7 @@ enum fscache_volume_trace {
 enum fscache_cookie_trace {
 	fscache_cookie_collision,
 	fscache_cookie_discard,
+	fscache_cookie_failed,
 	fscache_cookie_get_attach_object,
 	fscache_cookie_get_end_access,
 	fscache_cookie_get_hash_collision,
@@ -131,6 +132,7 @@ enum fscache_access_trace {
 #define fscache_cookie_traces						\
 	EM(fscache_cookie_collision,		"*COLLIDE*")		\
 	EM(fscache_cookie_discard,		"DISCARD  ")		\
+	EM(fscache_cookie_failed,		"FAILED   ")		\
 	EM(fscache_cookie_get_attach_object,	"GET attch")		\
 	EM(fscache_cookie_get_hash_collision,	"GET hcoll")		\
 	EM(fscache_cookie_get_end_access,	"GQ  endac")		\
-- 
2.37.1

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

