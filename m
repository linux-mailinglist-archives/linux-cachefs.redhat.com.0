Return-Path: <linux-cachefs+bncBDLIXLMFVAERB66DS2YAMGQE2RIAIMQ@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from mail-yw1-f197.google.com (mail-yw1-f197.google.com [209.85.128.197])
	by mail.lfdr.de (Postfix) with ESMTPS id B5A71890679
	for <lists+linux-cachefs@lfdr.de>; Thu, 28 Mar 2024 17:59:40 +0100 (CET)
Received: by mail-yw1-f197.google.com with SMTP id 00721157ae682-6112eb2c3f5sf17973957b3.2
        for <lists+linux-cachefs@lfdr.de>; Thu, 28 Mar 2024 09:59:40 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1711645179; cv=pass;
        d=google.com; s=arc-20160816;
        b=GfNeAXJU0OTNz+WJh75mwON5TfF2hB2Vp+1Bu5kVNYA0hnkFBLUdFqp49DIM+uQVzS
         6sKflrP18Sq+cAB7LEXZJR7iKOhpFyk80l0oFp33yKjnss9Tp0W7519aqeE6ImImZgKZ
         heO4EnNL+Td6/A+C3tsTJWUzkjm/a/nNMlxltm5rTyBR5cy/dd0wAyQ2axzy2nY6w28F
         dUX2/KxcvZUqCoJn6An6FDj/nDnmz0HUTs58AUrCzNXwrUFSqTmNmjpq/uC3rNk9fPeb
         YwfXRupa3QvUuOf+5Vw1cgkS0mDAPWbBv8Qxouc9ONqbdYfHM2IlVDL3nAv5RM/sndXf
         FE9w==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-archive:list-help:list-post:list-id
         :mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:delivered-to;
        bh=gZJC7punVDhhhvaMgA4eeal0I0swkbDVM9pVd3maZpg=;
        fh=MQ5SaVlMWAluCQEhDdWWORm4GBLjtr7B3P+9nM9w3nk=;
        b=E+XSrSuE6AjHZX+iJXSWPgr1TejieCt9hluVVy8ERF0eN583J/mrzupKtN8t3/cwyp
         R2FxJXIoZ+UMVR8Gxt75o5PiOr7n5ujfNUt3LevLdLIrEjUwbwuF2PCxEW7UNxRvcuT7
         eLdMVSPyn9lCsnZaV+5CQUGPTfCo4brytHxE6TDqOtLPjCg8SyxmFqEQK+ltrUHPUJhq
         yfm6jlREHZ+pTEsE6cyObvVbbBoyHnvCX7exqKdUecQxjXzNa2fEVdf0oSM9VhVvdWTu
         yLYF5elfQlxLgAAoAk412drFtSws8JuRDwI1/G/jvc2Cv29eaDaLB9yikuQ6Ylpsr+TQ
         J02Q==;
        darn=lfdr.de
ARC-Authentication-Results: i=2; mx.google.com;
       gateway.spf=pass (google.com: domain gapps.redhat.com configured 207.211.31.120 as internal address) smtp.mailfrom=dhowells@redhat.com smtp.remote-ip=207.211.31.120 policy.d=gapps.redhat.com
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711645179; x=1712249979;
        h=list-unsubscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender:mime-version
         :references:in-reply-to:message-id:date:subject:cc:to:from
         :delivered-to:x-beenthere:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gZJC7punVDhhhvaMgA4eeal0I0swkbDVM9pVd3maZpg=;
        b=WysKAgZfioA22/Quf7QlkEXjIY1gTYbLk+Xrpo0vvY46zhDMreSaoCS6VTTWIK2eG5
         zeVYYTRqOxl0CEpi03OQbaio6ocYYtwWwueBCd931cOZTcQYElCglA7kpWhyfjST0fZ3
         dt+0TNF+38x5FuadQBMPJOQaH/vbDI/gkgrpInyayPXZlY+FhTNb6B93hIJdY0PjaOmU
         pSvsqFOnwkiBk4XCLYv6cGBZPQHewSUg3nxyZIhn8m7awrHi36vk74v7uOE+nCRhUKbR
         C5EweqotaNyTk1TKSXDaeDOB+3tSWTdOQAALhQvpPOy6xgQJp2XbCPmUO9Fl94rzygeB
         bR5A==
X-Forwarded-Encrypted: i=2; AJvYcCXlQXO42sZKq4G+LTJrZT8219INZeGazQ7V30ofXxI4M63gUVvvdyOlxVceiVIF0ybLP6jGuZNT3IuyBrashHVJWdQpDjmtnREpO78=
X-Gm-Message-State: AOJu0YzQAMqM/Y5tRS381LjIVpnZ2HF6ojxjiwGkZvU6WV7J3AFGfW/N
	doQms949uJj++aApVoo1KJXPdJbgb/Ngg96vYuE567S/p9qXdikdWlqUUBjkMy8=
X-Google-Smtp-Source: AGHT+IGBzN0KPZF4hWKqizaPypTYWGLroKk9zZh/xxbBeOk7dIRmQzjcIhjfqUtOOkngDpSzvy6KtA==
X-Received: by 2002:a25:b85:0:b0:dda:c63d:8912 with SMTP id 127-20020a250b85000000b00ddac63d8912mr3440950ybl.34.1711645179649;
        Thu, 28 Mar 2024 09:59:39 -0700 (PDT)
X-BeenThere: linux-cachefs@redhat.com
Received: by 2002:a25:1c1:0:b0:dcd:202d:6bd6 with SMTP id 184-20020a2501c1000000b00dcd202d6bd6ls1529352ybb.1.-pod-prod-03-us;
 Thu, 28 Mar 2024 09:59:39 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUGVKzPEcOOhXur8PvA/dunHiWH8uf6YfHHd6oFWDIE0Eo5QB9HimBoPOOFrr4p3D/w/mn9nP8rCDtf9u8n6r/J2fFW8gdCiRvB9UK5gPo=
X-Received: by 2002:a81:9c47:0:b0:610:f7c0:aa87 with SMTP id n7-20020a819c47000000b00610f7c0aa87mr4776ywa.40.1711645178868;
        Thu, 28 Mar 2024 09:59:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1711645178; cv=none;
        d=google.com; s=arc-20160816;
        b=Tl3u9F1Jl11SniNaSO3flAp6Ihg+90f78137auoVaquPBubEE+hDGKxN0y/7wV2Bm0
         ixNZeYa3KUlliHfOsLM4lqBZsItdwaUmG7VrU1O7T/ysAIRKdzUD4ZWb36bEsiH39Z/A
         1OoLVeXtBACwK6Q/L/kVSPNnuDPOZXYVKbVncOLZEtdBh6jsFGIMgswIOP8vWq6o5w57
         ewzsGp10avu6x3aiYC0OTHsraSmX0qadzapdz9LZayGZswrbKSr2+0FgD7YOCM/317PL
         UaEEE53R+zefHS5FcX7KfQ37RQaUEF14P0aFaXsHkzl8wJQik9tFHF5FwbUkmfL4yRql
         v5bw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:delivered-to;
        bh=tzNFrIx51OPZGYIohrzRvwjxtNHaaHVdYPKmPKDLG9U=;
        fh=oodmRKDi9WgwC2gH74uORLc3G9y6uDHX8GjesF5Bym4=;
        b=QaUptATO4Pfq5aB8z8zEvxTe+SlTviSWwk70Irp6wGF6jJlyQ/m3Fx2s1kC25AmA7h
         /Eh4Z8YciDGQQVjBqbJTRpjuyt5Cp0u0QFF1pot+SlHmESdqTK57oxC80p3HeQ5fdYw/
         YzAM6uV8lvBIQLTZ80L8XypbZEzR1xiTwyEMusWiMIp5B1/5+rKgY1GTomzwPVfn8jBe
         SCejuDXN8Pclr26+gdY4ExPvN7AvpHhn/sWnB0PCbgxaNLAT1F8dseNe/UCkjGS/NbNO
         w/RVh2F6GpPnsa+oLDfIwm++WTn2lEFuS75aCVO6o53D/FzZDN3jj4l+JNX2a2g6KOfz
         Np4A==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       gateway.spf=pass (google.com: domain gapps.redhat.com configured 207.211.31.120 as internal address) smtp.mailfrom=dhowells@redhat.com smtp.remote-ip=207.211.31.120 policy.d=gapps.redhat.com
Received: from us-smtp-inbound-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com. [207.211.31.120])
        by mx.google.com with ESMTPS id y21-20020a05620a44d500b0078a2678b5d3si1968208qkp.230.2024.03.28.09.59.38
        for <linux-cachefs@gapps.redhat.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Mar 2024 09:59:38 -0700 (PDT)
Received-SPF: pass (google.com: domain gapps.redhat.com configured 207.211.31.120 as internal address)
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-425-i45iuVquM4-W9ustrWVTcg-1; Thu, 28 Mar 2024 12:59:36 -0400
X-MC-Unique: i45iuVquM4-W9ustrWVTcg-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4F0148007A1
	for <linux-cachefs@gapps.redhat.com>; Thu, 28 Mar 2024 16:59:36 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
	id 4BC91492BDD; Thu, 28 Mar 2024 16:59:36 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.com (unknown [10.42.28.146])
	by smtp.corp.redhat.com (Postfix) with ESMTP id D6D84492BD0;
	Thu, 28 Mar 2024 16:59:33 +0000 (UTC)
From: David Howells <dhowells@redhat.com>
To: Steve French <smfrench@gmail.com>
Cc: David Howells <dhowells@redhat.com>,
	Jeff Layton <jlayton@kernel.org>,
	Matthew Wilcox <willy@infradead.org>,
	Paulo Alcantara <pc@manguebit.com>,
	Shyam Prasad N <sprasad@microsoft.com>,
	Tom Talpey <tom@talpey.com>,
	Christian Brauner <christian@brauner.io>,
	netfs@lists.linux.dev,
	linux-cifs@vger.kernel.org,
	linux-fsdevel@vger.kernel.org,
	linux-mm@kvack.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Steve French <sfrench@samba.org>,
	Shyam Prasad N <nspmangalore@gmail.com>,
	Rohith Surabattula <rohiths.msft@gmail.com>,
	linux-cachefs@redhat.com
Subject: [PATCH v6 04/15] cifs: Make wait_mtu_credits take size_t args
Date: Thu, 28 Mar 2024 16:57:55 +0000
Message-ID: <20240328165845.2782259-5-dhowells@redhat.com>
In-Reply-To: <20240328165845.2782259-1-dhowells@redhat.com>
References: <20240328165845.2782259-1-dhowells@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.10
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"; x-default=true
X-Original-Sender: dhowells@redhat.com
X-Original-Authentication-Results: mx.google.com;       gateway.spf=pass
 (google.com: domain gapps.redhat.com configured 207.211.31.120 as internal
 address) smtp.mailfrom=dhowells@redhat.com smtp.remote-ip=207.211.31.120 policy.d=gapps.redhat.com
Precedence: list
Mailing-list: list linux-cachefs@redhat.com; contact linux-cachefs+owners@redhat.com
List-ID: <linux-cachefs.redhat.com>
X-Spam-Checked-In-Group: linux-cachefs@redhat.com
X-Google-Group-Id: 998933772329
List-Post: <https://groups.google.com/a/redhat.com/group/linux-cachefs/post>, <mailto:linux-cachefs@redhat.com>
List-Help: <https://support.google.com/a/redhat.com/bin/topic.py?topic=25838>, <mailto:linux-cachefs+help@redhat.com>
List-Archive: <https://groups.google.com/a/redhat.com/group/linux-cachefs/>
List-Unsubscribe: <mailto:googlegroups-manage+998933772329+unsubscribe@googlegroups.com>,
 <https://groups.google.com/a/redhat.com/group/linux-cachefs/subscribe>

Make the wait_mtu_credits functions use size_t for the size and num
arguments rather than unsigned int as netfslib uses size_t/ssize_t for
arguments and return values to allow for extra capacity.

Signed-off-by: David Howells <dhowells@redhat.com>
cc: Steve French <sfrench@samba.org>
cc: Shyam Prasad N <nspmangalore@gmail.com>
cc: Rohith Surabattula <rohiths.msft@gmail.com>
cc: Jeff Layton <jlayton@kernel.org>
cc: linux-cifs@vger.kernel.org
cc: linux-cachefs@redhat.com
cc: netfs@lists.linux.dev
cc: linux-mm@kvack.org
---
 fs/smb/client/cifsglob.h  |  4 ++--
 fs/smb/client/cifsproto.h |  2 +-
 fs/smb/client/file.c      | 17 ++++++++++-------
 fs/smb/client/smb2ops.c   |  4 ++--
 fs/smb/client/transport.c |  4 ++--
 5 files changed, 17 insertions(+), 14 deletions(-)

diff --git a/fs/smb/client/cifsglob.h b/fs/smb/client/cifsglob.h
index ff86ab3d6166..6436d360b9f4 100644
--- a/fs/smb/client/cifsglob.h
+++ b/fs/smb/client/cifsglob.h
@@ -546,8 +546,8 @@ struct smb_version_operations {
 	/* writepages retry size */
 	unsigned int (*wp_retry_size)(struct inode *);
 	/* get mtu credits */
-	int (*wait_mtu_credits)(struct TCP_Server_Info *, unsigned int,
-				unsigned int *, struct cifs_credits *);
+	int (*wait_mtu_credits)(struct TCP_Server_Info *, size_t,
+				size_t *, struct cifs_credits *);
 	/* adjust previously taken mtu credits to request size */
 	int (*adjust_credits)(struct TCP_Server_Info *server,
 			      struct cifs_credits *credits,
diff --git a/fs/smb/client/cifsproto.h b/fs/smb/client/cifsproto.h
index 010601a89fe5..95b5fa385196 100644
--- a/fs/smb/client/cifsproto.h
+++ b/fs/smb/client/cifsproto.h
@@ -121,7 +121,7 @@ extern struct mid_q_entry *cifs_setup_async_request(struct TCP_Server_Info *,
 extern int cifs_check_receive(struct mid_q_entry *mid,
 			struct TCP_Server_Info *server, bool log_error);
 extern int cifs_wait_mtu_credits(struct TCP_Server_Info *server,
-				 unsigned int size, unsigned int *num,
+				 size_t size, size_t *num,
 				 struct cifs_credits *credits);
 extern int SendReceive2(const unsigned int /* xid */ , struct cifs_ses *,
 			struct kvec *, int /* nvec to send */,
diff --git a/fs/smb/client/file.c b/fs/smb/client/file.c
index c5850a1c484f..76bfefa9b669 100644
--- a/fs/smb/client/file.c
+++ b/fs/smb/client/file.c
@@ -2704,7 +2704,8 @@ static ssize_t cifs_write_back_from_locked_folio(struct address_space *mapping,
 	struct cifs_credits *credits = &credits_on_stack;
 	struct cifsFileInfo *cfile = NULL;
 	unsigned long long i_size = i_size_read(inode), max_len;
-	unsigned int xid, wsize;
+	unsigned int xid;
+	size_t wsize;
 	size_t len = folio_size(folio);
 	long count = wbc->nr_to_write;
 	int rc;
@@ -3206,7 +3207,7 @@ static int
 cifs_resend_wdata(struct cifs_io_subrequest *wdata, struct list_head *wdata_list,
 	struct cifs_aio_ctx *ctx)
 {
-	unsigned int wsize;
+	size_t wsize;
 	struct cifs_credits credits;
 	int rc;
 	struct TCP_Server_Info *server = wdata->server;
@@ -3341,7 +3342,8 @@ cifs_write_from_iter(loff_t fpos, size_t len, struct iov_iter *from,
 	do {
 		struct cifs_credits credits_on_stack;
 		struct cifs_credits *credits = &credits_on_stack;
-		unsigned int wsize, nsegs = 0;
+		unsigned int nsegs = 0;
+		size_t wsize;
 
 		if (signal_pending(current)) {
 			rc = -EINTR;
@@ -3778,7 +3780,7 @@ static int cifs_resend_rdata(struct cifs_io_subrequest *rdata,
 			struct list_head *rdata_list,
 			struct cifs_aio_ctx *ctx)
 {
-	unsigned int rsize;
+	size_t rsize;
 	struct cifs_credits credits;
 	int rc;
 	struct TCP_Server_Info *server;
@@ -3852,10 +3854,10 @@ cifs_send_async_read(loff_t fpos, size_t len, struct cifsFileInfo *open_file,
 		     struct cifs_aio_ctx *ctx)
 {
 	struct cifs_io_subrequest *rdata;
-	unsigned int rsize, nsegs, max_segs = INT_MAX;
+	unsigned int nsegs, max_segs = INT_MAX;
 	struct cifs_credits credits_on_stack;
 	struct cifs_credits *credits = &credits_on_stack;
-	size_t cur_len, max_len;
+	size_t cur_len, max_len, rsize;
 	int rc;
 	pid_t pid;
 	struct TCP_Server_Info *server;
@@ -4451,12 +4453,13 @@ static void cifs_readahead(struct readahead_control *ractl)
 	 * Chop the readahead request up into rsize-sized read requests.
 	 */
 	while ((nr_pages = ra_pages)) {
-		unsigned int i, rsize;
+		unsigned int i;
 		struct cifs_io_subrequest *rdata;
 		struct cifs_credits credits_on_stack;
 		struct cifs_credits *credits = &credits_on_stack;
 		struct folio *folio;
 		pgoff_t fsize;
+		size_t rsize;
 
 		/*
 		 * Find out if we have anything cached in the range of
diff --git a/fs/smb/client/smb2ops.c b/fs/smb/client/smb2ops.c
index b185b07ea86b..2413006e5f39 100644
--- a/fs/smb/client/smb2ops.c
+++ b/fs/smb/client/smb2ops.c
@@ -217,8 +217,8 @@ smb2_get_credits(struct mid_q_entry *mid)
 }
 
 static int
-smb2_wait_mtu_credits(struct TCP_Server_Info *server, unsigned int size,
-		      unsigned int *num, struct cifs_credits *credits)
+smb2_wait_mtu_credits(struct TCP_Server_Info *server, size_t size,
+		      size_t *num, struct cifs_credits *credits)
 {
 	int rc = 0;
 	unsigned int scredits, in_flight;
diff --git a/fs/smb/client/transport.c b/fs/smb/client/transport.c
index e52967de59e6..5a69a7430ffa 100644
--- a/fs/smb/client/transport.c
+++ b/fs/smb/client/transport.c
@@ -691,8 +691,8 @@ wait_for_compound_request(struct TCP_Server_Info *server, int num,
 }
 
 int
-cifs_wait_mtu_credits(struct TCP_Server_Info *server, unsigned int size,
-		      unsigned int *num, struct cifs_credits *credits)
+cifs_wait_mtu_credits(struct TCP_Server_Info *server, size_t size,
+		      size_t *num, struct cifs_credits *credits)
 {
 	*num = size;
 	credits->value = 0;

-- 
You received this message because you are subscribed to the Google Groups "linux-cachefs@redhat.com" group.
To unsubscribe from this group and stop receiving emails from it, send an email to linux-cachefs+unsubscribe@redhat.com.

