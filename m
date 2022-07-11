Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C83757FD1B
	for <lists+linux-cachefs@lfdr.de>; Mon, 25 Jul 2022 12:09:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1658743792;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=PUZqb/JgmvfP7wR7bUJcr4nuQ5imMWoSSKjnYX+RXAA=;
	b=Ef7FZVGazxK1BAXrOXqAErGVwNr5YwTbEBTZ82dp7H3gZ0kFBot8AnzL1J9z/4sWs9RqJH
	uO5rlder49jIw0dhPmc+TJjBOyi2UxSd/Id8WcAsy3iTrEEIVoGcoPob7WQkrcE3Mfk2Fm
	DlfAX04JSQ87knXle4Sh6uklaAcjpb0=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-516-j7lMRKYONkynizal7fvC7A-1; Mon, 25 Jul 2022 06:09:49 -0400
X-MC-Unique: j7lMRKYONkynizal7fvC7A-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id AF6993C0E202;
	Mon, 25 Jul 2022 10:09:48 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (unknown [10.30.29.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id A4CD840C1288;
	Mon, 25 Jul 2022 10:09:48 +0000 (UTC)
Received: from mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (localhost [IPv6:::1])
	by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with ESMTP id 8364D1945D87;
	Mon, 25 Jul 2022 10:09:48 +0000 (UTC)
X-Original-To: linux-cachefs@listman.corp.redhat.com
Delivered-To: linux-cachefs@listman.corp.redhat.com
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 by mm-prod-listman-01.mail-001.prod.us-east-1.aws.redhat.com (Postfix) with
 ESMTP id 7E09B194704D for <linux-cachefs@listman.corp.redhat.com>;
 Mon, 11 Jul 2022 03:17:04 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
 id 6A982492CA2; Mon, 11 Jul 2022 03:17:04 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
 (mimecast08.extmail.prod.ext.rdu2.redhat.com [10.11.55.24])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 66898492C3B
 for <linux-cachefs@redhat.com>; Mon, 11 Jul 2022 03:17:04 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5237B3804510
 for <linux-cachefs@redhat.com>; Mon, 11 Jul 2022 03:17:04 +0000 (UTC)
Received: from mail.nfschina.com (mail.nfschina.com [124.16.136.209]) by
 relay.mimecast.com with ESMTP id us-mta-367-TikhcexOPEGI2cscUQMGZw-1; Sun,
 10 Jul 2022 23:16:29 -0400
X-MC-Unique: TikhcexOPEGI2cscUQMGZw-1
Received: from localhost (unknown [127.0.0.1])
 by mail.nfschina.com (Postfix) with ESMTP id 97E4C1E80CCF;
 Mon, 11 Jul 2022 11:08:15 +0800 (CST)
X-Virus-Scanned: amavisd-new at test.com
Received: from mail.nfschina.com ([127.0.0.1])
 by localhost (mail.nfschina.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7VoIDh0yRE-W; Mon, 11 Jul 2022 11:08:13 +0800 (CST)
Received: from node1.localdomain (unknown [219.141.250.2])
 (Authenticated sender: zeming@nfschina.com)
 by mail.nfschina.com (Postfix) with ESMTPA id E30AF1E80CAB;
 Mon, 11 Jul 2022 11:08:12 +0800 (CST)
From: Li zeming <zeming@nfschina.com>
To: dhowells@redhat.com
Date: Mon, 11 Jul 2022 11:10:55 +0800
Message-Id: <20220711031055.2874-1-zeming@nfschina.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
 Definition; Similar Internal Domain=false;
 Similar Monitored External Domain=false; Custom External Domain=false;
 Mimecast External Domain=false; Newly Observed Domain=false;
 Internal User Name=false; Custom Display Name List=false;
 Reply-to Address Mismatch=false; Targeted Threat Dictionary=false;
 Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
X-Mailman-Approved-At: Mon, 25 Jul 2022 10:09:45 +0000
Subject: [Linux-cachefs] [PATCH] cachefiles/cachefiles: optimize the string
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
Cc: kernel@nfschina.com, linux-cachefs@redhat.com, linux-kernel@vger.kernel.org,
 Li zeming <zeming@nfschina.com>
MIME-Version: 1.0
Errors-To: linux-cachefs-bounces@redhat.com
Sender: "Linux-cachefs" <linux-cachefs-bounces@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

I think the comma in this string can be removed, so that the output
information is more standardized.

Signed-off-by: Li zeming <zeming@nfschina.com>
---
 fs/cachefiles/namei.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/cachefiles/namei.c b/fs/cachefiles/namei.c
index facf2ebe464b..28b93e798ef7 100644
--- a/fs/cachefiles/namei.c
+++ b/fs/cachefiles/namei.c
@@ -100,7 +100,7 @@ struct dentry *cachefiles_get_directory(struct cachefiles_cache *cache,
 	struct path path;
 	int ret;
 
-	_enter(",,%s", dirname);
+	_enter(",%s", dirname);
 
 	/* search the current directory for the element name */
 	inode_lock_nested(d_inode(dir), I_MUTEX_PARENT);
-- 
2.18.2

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

