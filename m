Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 6ED7949B57A
	for <lists+linux-cachefs@lfdr.de>; Tue, 25 Jan 2022 14:58:37 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1643119116;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=w+VojfCUcA5oCgUsO0tRFcfyM++EFuQhtXwp3IKFlKQ=;
	b=Vcni1dloSBuocRXgmtgvSq+VWYkDIlPlyCmh9plrGFrRlhLUoJmq/PAk3lBVfgZs/pdltx
	dTx+A8QEQqbzXGoQo3ru/OmnR5TQOaYWlfdSvekEeH2UW0/jC2slfwe/IHbqKUPVR0jPIA
	p8mHCUQd/v7CoKxk9RxUzVQKGQG9KJU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-616-XsTC_B_COx2RN1-occqE6w-1; Tue, 25 Jan 2022 08:58:33 -0500
X-MC-Unique: XsTC_B_COx2RN1-occqE6w-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5F4EA39381;
	Tue, 25 Jan 2022 13:58:31 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 514707E121;
	Tue, 25 Jan 2022 13:58:31 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id EA6AD1809CB8;
	Tue, 25 Jan 2022 13:58:30 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 20PDvsOu023197 for <linux-cachefs@listman.util.phx.redhat.com>;
	Tue, 25 Jan 2022 08:57:54 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id AF84A7E121; Tue, 25 Jan 2022 13:57:54 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.uk (unknown [10.33.36.5])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 615C87E11B;
	Tue, 25 Jan 2022 13:57:53 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
	Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
	Kingdom.
	Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
To: smfrench@gmail.com, nspmangalore@gmail.com
Date: Tue, 25 Jan 2022 13:57:52 +0000
Message-ID: <164311907254.2806745.4350376870116513772.stgit@warthog.procyon.org.uk>
In-Reply-To: <164311902471.2806745.10187041199819525677.stgit@warthog.procyon.org.uk>
References: <164311902471.2806745.10187041199819525677.stgit@warthog.procyon.org.uk>
User-Agent: StGit/0.23
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-loop: linux-cachefs@redhat.com
Cc: linux-cifs@vger.kernel.org, linux-cachefs@redhat.com, jlayton@kernel.org,
	linux-fsdevel@vger.kernel.org
Subject: [Linux-cachefs] [RFC PATCH 2/7] cifs: Miscellaneous bits
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit


---

 fs/cifs/connect.c |    2 +-
 fs/cifs/file.c    |    8 +++++++-
 2 files changed, 8 insertions(+), 2 deletions(-)

diff --git a/fs/cifs/connect.c b/fs/cifs/connect.c
index 11a22a30ee14..ed210d774a21 100644
--- a/fs/cifs/connect.c
+++ b/fs/cifs/connect.c
@@ -162,7 +162,7 @@ static void cifs_resolve_server(struct work_struct *work)
 	mutex_unlock(&server->srv_mutex);
 }
 
-/**
+/*
  * Mark all sessions and tcons for reconnect.
  *
  * @server needs to be previously set to CifsNeedReconnect.
diff --git a/fs/cifs/file.c b/fs/cifs/file.c
index 1cce7e5b2334..24722fe75def 100644
--- a/fs/cifs/file.c
+++ b/fs/cifs/file.c
@@ -4205,13 +4205,19 @@ cifs_page_mkwrite(struct vm_fault *vmf)
 {
 	struct page *page = vmf->page;
 
+	/* Wait for the page to be written to the cache before we allow it to
+	 * be modified.  We then assume the entire page will need writing back.
+	 */
 #ifdef CONFIG_CIFS_FSCACHE
 	if (PageFsCache(page) &&
 	    wait_on_page_fscache_killable(page) < 0)
 		return VM_FAULT_RETRY;
 #endif
 
-	lock_page(page);
+	wait_on_page_writeback(page);
+
+	if (lock_page_killable(page) < 0)
+		return VM_FAULT_RETRY;
 	return VM_FAULT_LOCKED;
 }
 


--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

