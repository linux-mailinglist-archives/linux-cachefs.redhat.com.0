Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DF4258915E
	for <lists+linux-cachefs@lfdr.de>; Wed,  3 Aug 2022 19:26:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1659547618;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=yyEhLcSFusyW3MvvC0qoG/G8OrtkliZ/pW7AgJIDaWE=;
	b=NvrSc6YyPQ4Z6VxhC9tU1m093tHVwcpRQ2fTboqagzFjb1+WMKAuSm/tNXjKosbiIihUiQ
	4Wc6XgN1YCGDI4bSEhGmSfi5BaURQ1u43nd0QSxVRW6AamKjoZVuPMMQkf56Pq+YpW0d9i
	tdsXUEg0O+1YKMS5OKF1c3pvbuPrcZc=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-633-4UWVaRhGMDiOtjBTQDmksQ-1; Wed, 03 Aug 2022 13:26:55 -0400
X-MC-Unique: 4UWVaRhGMDiOtjBTQDmksQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 047FE185A794;
	Wed,  3 Aug 2022 17:26:55 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 27B5AC28100;
	Wed,  3 Aug 2022 17:26:52 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id C123C1946A5C;
	Wed,  3 Aug 2022 17:26:51 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 88B171946A52 for <linux-cachefs@listman.corp.redhat.com>;
 Wed,  3 Aug 2022 17:26:50 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 709A34010D27; Wed,  3 Aug 2022 17:26:50 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast10.extmail.prod.ext.rdu2.redhat.com [10.11.55.26])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 6CF1E4010FA5
 for <linux-cachefs@redhat.com>; Wed,  3 Aug 2022 17:26:50 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 508F41C06901
 for <linux-cachefs@redhat.com>; Wed,  3 Aug 2022 17:26:50 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [139.178.84.217]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-84-eoicvNKgMYKhBX_4bUpu2g-1; Wed, 03 Aug 2022 13:26:46 -0400
X-MC-Unique: eoicvNKgMYKhBX_4bUpu2g-1
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id E15F360C40;
 Wed,  3 Aug 2022 17:26:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E50CDC433D6;
 Wed,  3 Aug 2022 17:26:44 +0000 (UTC)
From: Jeff Layton <jlayton@kernel.org>
To: dhowells@redhat.com
Date: Wed,  3 Aug 2022 13:26:43 -0400
Message-Id: <20220803172643.175411-1-jlayton@kernel.org>
MIME-Version: 1.0
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
Subject: [Linux-cachefs] [PATCH] fscache: don't leak cookie refs if an
 invalidation is already in progress
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
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

It's possible for a request to invalidate a fscache_cookie will come in
while we're already processing an invalidation. If that happens we
currently take an extra access reference that will leak. Only call
__fscache_begin_cookie_access if the FSCACHE_COOKIE_DO_INVALIDATE bit
was previously clear.

Suggested-by: David Howells <dhowells@redhat.com>
Signed-off-by: Jeff Layton <jlayton@kernel.org>
---
 fs/fscache/cookie.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/fs/fscache/cookie.c b/fs/fscache/cookie.c
index 74920826d8f6..8b1499be3d62 100644
--- a/fs/fscache/cookie.c
+++ b/fs/fscache/cookie.c
@@ -1063,8 +1063,8 @@ void __fscache_invalidate(struct fscache_cookie *cookie,
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

