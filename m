Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id BF3F358A996
	for <lists+linux-cachefs@lfdr.de>; Fri,  5 Aug 2022 12:43:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1659696180;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=eU8S00vEMwt5brL+jOUbtRD1t3Aujx2E2FqsxL6AkTk=;
	b=ONpGu2kdLqMfqwNvQw4cHJ9AIRVvYtaIdvJ6WdvL5Yx8uiKMiQiX1Tz8f7jG5ZStO82T84
	wQCNasRGGQ+uNIG4zrtTMN48ReXxHQ8CtH/yzIBLXaX1qdLLC5uWEao2DWDwVSKpSOfCs1
	9A/aMIUkGhi5IbFg4+wsb5uIzENlUSY=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-223-pS-co6AdOnKcYCs06j-MRg-1; Fri, 05 Aug 2022 06:42:59 -0400
X-MC-Unique: pS-co6AdOnKcYCs06j-MRg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com [10.11.54.5])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B1D152813D22;
	Fri,  5 Aug 2022 10:42:58 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id DB30018EB7;
	Fri,  5 Aug 2022 10:42:55 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 545081946A63;
	Fri,  5 Aug 2022 10:42:55 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 249721946A5F for <linux-cachefs@listman.corp.redhat.com>;
 Fri,  5 Aug 2022 10:42:54 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id E4C702026D07; Fri,  5 Aug 2022 10:42:53 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E0CBC2026D4C
 for <linux-cachefs@redhat.com>; Fri,  5 Aug 2022 10:42:53 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C483C101A589
 for <linux-cachefs@redhat.com>; Fri,  5 Aug 2022 10:42:53 +0000 (UTC)
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-195-FEk54uThMR-acauyEaTFRA-1; Fri, 05 Aug 2022 06:42:49 -0400
X-MC-Unique: FEk54uThMR-acauyEaTFRA-1
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 431F6B82864;
 Fri,  5 Aug 2022 10:42:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A3025C433D7;
 Fri,  5 Aug 2022 10:42:46 +0000 (UTC)
From: Jeff Layton <jlayton@kernel.org>
To: dhowells@redhat.com
Date: Fri,  5 Aug 2022 06:42:45 -0400
Message-Id: <20220805104245.14928-1-jlayton@kernel.org>
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
Subject: [Linux-cachefs] [PATCH v2] fscache: don't leak cookie access refs
 if invalidation is in progress or failed
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

It's possible for a request to invalidate a fscache_cookie will come in
while we're already processing an invalidation. If that happens we
currently take an extra access reference that will leak. Only call
__fscache_begin_cookie_access if the FSCACHE_COOKIE_DO_INVALIDATE bit
was previously clear.

Also, ensure that we attempt to clear the bit when the cookie is
"FAILED" and put the reference to avoid an access leak.

Suggested-by: David Howells <dhowells@redhat.com>
Signed-off-by: Jeff Layton <jlayton@kernel.org>
---
 fs/fscache/cookie.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/fs/fscache/cookie.c b/fs/fscache/cookie.c
index 74920826d8f6..26a6d395737a 100644
--- a/fs/fscache/cookie.c
+++ b/fs/fscache/cookie.c
@@ -739,6 +739,9 @@ static void fscache_cookie_state_machine(struct fscache_cookie *cookie)
 		fallthrough;
 
 	case FSCACHE_COOKIE_STATE_FAILED:
+		if (test_and_clear_bit(FSCACHE_COOKIE_DO_INVALIDATE, &cookie->flags))
+			fscache_end_cookie_access(cookie, fscache_access_invalidate_cookie_end);
+
 		if (atomic_read(&cookie->n_accesses) != 0)
 			break;
 		if (test_bit(FSCACHE_COOKIE_DO_RELINQUISH, &cookie->flags)) {
@@ -1063,8 +1066,8 @@ void __fscache_invalidate(struct fscache_cookie *cookie,
 		return;
 
 	case FSCACHE_COOKIE_STATE_LOOKING_UP:
-		__fscache_begin_cookie_access(cookie, fscache_access_invalidate_cookie);
-		set_bit(FSCACHE_COOKIE_DO_INVALIDATE, &cookie->flags);
+		if (!test_and_set_bit(FSCACHE_COOKIE_DO_INVALIDATE, &cookie->flags))
+			__fscache_begin_cookie_access(cookie, fscache_access_invalidate_cookie);
 		fallthrough;
 	case FSCACHE_COOKIE_STATE_CREATING:
 		spin_unlock(&cookie->lock);
-- 
2.37.1

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

