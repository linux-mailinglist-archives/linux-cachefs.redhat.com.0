Return-Path: <linux-cachefs+bncBDLIXLMFVAERBNVR36VAMGQETTUXROA@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com [209.85.167.198])
	by mail.lfdr.de (Postfix) with ESMTPS id B40577EF9DE
	for <lists+linux-cachefs@lfdr.de>; Fri, 17 Nov 2023 22:18:47 +0100 (CET)
Received: by mail-oi1-f198.google.com with SMTP id 5614622812f47-3b2e2487c6bsf2743527b6e.2
        for <lists+linux-cachefs@lfdr.de>; Fri, 17 Nov 2023 13:18:47 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1700255926; cv=pass;
        d=google.com; s=arc-20160816;
        b=D4Iw4qltLCGQ/PR8i3CuOTFEkd/G3P86jKwHc+4/DV9Hy493sFkIuGJGQRWGEfkmlC
         134dOnysAmeW8mN6p3ibtzpNy7sO4QhUUWnhwJ4I4wQsxubCR/E3nk5rKobJHcgsUupn
         H+sHl6Mch35j+7NfFM+R8mX9VqAIQNJ+famCcVG+NNHVK4rZe9nK0I+bZDLDiyMCRN4F
         S8ivGxRwnluuFJ7WfmaDt7xRKD0/0b91i7SY3hKA5KXAAi/tYDI57ye+xJLUpkQpYiA+
         Iz3bidr6R5l7PoBz47iQhw6HCmBVfvir4GnUsFljuvc5VRkGdAJgre+ffCHHMQsdzEBs
         4e0w==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-archive:list-help:list-post:list-id
         :mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:delivered-to;
        bh=7LblMwYEEYkOYhfmDyGCOHh7MwDU7MLVRKl8Wji24CA=;
        fh=AI41B/YzCSs7tBbUxY970+MFg5Gw1IjT3WzpBEwdswQ=;
        b=Ic2WFfrbqXPkbVa/t+h3w8i0twNKCZMFy0xIxTL+ViswAXmrDLxWRDXgnnAzbk4rBl
         ODFI45nJDp1tB2FBy1dOHN9rbeXUcGuUHkpVWAv8at//9Y7o3p6lrPSVBv1PTikbuG+d
         Hrniprw0k85xmEjHsmCOS11XXI5+fgSOoxc021ghS63mSd2N5cNiQJoQf2tJ5G8noGvI
         eMUDuehpeh89iWBbCOrid/RzALPVX8ez/m85iDB+LO4a3YEL9/9Gl9MXEJV1VEA9dP4O
         oIbieVOg7mG8vflIRKNoEjuu0hK0CZd8aPrf7E+1OQoaCxAUYB2Ppwe576SHfwkD4b6D
         /rpQ==
ARC-Authentication-Results: i=2; mx.google.com;
       spf=pass (google.com: domain gapps.redhat.com configured 207.211.31.120 as internal address) smtp.mailfrom=dhowells@redhat.com
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700255926; x=1700860726;
        h=list-unsubscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender:mime-version
         :references:in-reply-to:message-id:date:subject:cc:to:from
         :delivered-to:x-beenthere:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7LblMwYEEYkOYhfmDyGCOHh7MwDU7MLVRKl8Wji24CA=;
        b=u9JLwYXu/4fgzw3TAAUFbnBIS2gMUUZpDoy+/R9/JoTcRtShzegWF7hUxJ3bVRf5Mi
         9Cutr8E6xR1Zsat47f97cv6EF18FXeGdL+NZ5AZTeUr27qhL77+LyAVMgyVyEz2qEHr2
         XtPHyPXFvhjq4WSL+Toyq1P4jR2zvp73sJB9KVQe+Hol8Fh+gpIVQluuoGfL7Zrf5Hte
         I7a+lrwkUw8fk0YemzIBnVXNHoCRKCW7JWELLY7ZH3tfs2rsDdCblTQGyiMcROq/gEjU
         d2XLJKzwiePJzxPSA25XZHBMQekPWHXZ7iNx0tPnplmMfvRYgZdmdvPxWt6KPIzJ4bz8
         SdBA==
X-Gm-Message-State: AOJu0Yx9BBqmXlVCYHABibcH3J9pbwDIuF+tq8OAx2/bBHhVT4ukjBKG
	nRIw/Jy2lILjjXTptNWUtHoc7g==
X-Google-Smtp-Source: AGHT+IF97ooP3vmo4hhrMR/yqmzq4ZZa6UaXSh1kLbIMq2r7iTmXQ/tRvVCva4Ssu2BBIgTmVksZvw==
X-Received: by 2002:a05:6358:2489:b0:16b:c403:1689 with SMTP id m9-20020a056358248900b0016bc4031689mr687900rwc.9.1700255926497;
        Fri, 17 Nov 2023 13:18:46 -0800 (PST)
X-BeenThere: linux-cachefs@redhat.com
Received: by 2002:a0c:e844:0:b0:65b:2cc9:5f15 with SMTP id l4-20020a0ce844000000b0065b2cc95f15ls2208298qvo.1.-pod-prod-07-us;
 Fri, 17 Nov 2023 13:18:46 -0800 (PST)
X-Received: by 2002:a05:6102:5489:b0:462:7377:b33 with SMTP id bk9-20020a056102548900b0046273770b33mr749762vsb.30.1700255925902;
        Fri, 17 Nov 2023 13:18:45 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1700255925; cv=none;
        d=google.com; s=arc-20160816;
        b=gMVPLbVEaNtRk07c5CaU29b4dyL6+W2pQO+ymJTFAxIB5ri6D5nlAc5cRrRQErm19U
         EuDfFUTxFvfCtKBeNeBgvCQypSXuzSrsKLvHN3UZh5h3Vwu+6uwxw3jC9N1Gp4mI8im6
         JoIqK8VAO2ejCR0cVEFHsXiAfxNGn3OdVRStP02coMYGtrRLTO9WWA1cQlexljm3q+NQ
         nzM3TBT/a1uY3K334EZ8HLnr048AdnBFrG3igVFbi9DYO/hW/zb7UQt+YCAs7LeM5euk
         v43hZlJylRB4SxWbCX/1p9XN3ZNxF/FPXp342Ai/ax9JHxF/8lG65LHO05tIUUBKiDdS
         XVyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:delivered-to;
        bh=F1Bu22gnjoTinDIEaWTyZ/Cz7QBpdn6BKVutBUI1hCg=;
        fh=AI41B/YzCSs7tBbUxY970+MFg5Gw1IjT3WzpBEwdswQ=;
        b=jn9Lcm/FIsfX+goMxuAqb68I1AOJWfy39gGs+i2jVSwtd/PnaLUDlBG5nH14wrQXo8
         oGQfRCQ0tBFRP9v5S/YKgCrv4ClOQbuecBD1mCdmajs2A7SShI8o4bq8onoXYSnj6D8w
         3BzP76kULgP+04Q43dJRT+OWddNNAhUC0xMcgkbyeGXc05vffvWxCYuTXiDhz7K6aPjq
         7SuRTfEYmujhZ3IQ4xgoUYktlh6cu/zDQdfOY7+QmZ6Tq96z6yRL0ku36d7NoqxiIYnH
         bbQ62I3epcoQhYSVD7J3dmU4Xv+fv3s1ZBSSUAGQ39VIMbQL6BMI0VTDCKTNZ3TqDBsW
         DfKA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain gapps.redhat.com configured 207.211.31.120 as internal address) smtp.mailfrom=dhowells@redhat.com
Received: from us-smtp-inbound-delivery-1.mimecast.com (us-smtp-inbound-delivery-1.mimecast.com. [207.211.31.120])
        by mx.google.com with ESMTPS id i17-20020ab00d91000000b0079d85569be7si590293uak.132.2023.11.17.13.18.45
        for <linux-cachefs@gapps.redhat.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Nov 2023 13:18:45 -0800 (PST)
Received-SPF: pass (google.com: domain gapps.redhat.com configured 207.211.31.120 as internal address)
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-467-0ccRb-buMl6DAh2GrY5ZbA-1; Fri,
 17 Nov 2023 16:18:44 -0500
X-MC-Unique: 0ccRb-buMl6DAh2GrY5ZbA-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com [10.11.54.9])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 123873822556
	for <linux-cachefs@gapps.redhat.com>; Fri, 17 Nov 2023 21:18:44 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
	id 0F480492BE9; Fri, 17 Nov 2023 21:18:44 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.com (unknown [10.42.28.16])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 1EB31492BE0;
	Fri, 17 Nov 2023 21:18:41 +0000 (UTC)
From: David Howells <dhowells@redhat.com>
To: Jeff Layton <jlayton@kernel.org>,
	Steve French <smfrench@gmail.com>
Cc: David Howells <dhowells@redhat.com>,
	Matthew Wilcox <willy@infradead.org>,
	Marc Dionne <marc.dionne@auristor.com>,
	Paulo Alcantara <pc@manguebit.com>,
	Shyam Prasad N <sprasad@microsoft.com>,
	Tom Talpey <tom@talpey.com>,
	Dominique Martinet <asmadeus@codewreck.org>,
	Ilya Dryomov <idryomov@gmail.com>,
	Christian Brauner <christian@brauner.io>,
	linux-cachefs@redhat.com,
	linux-afs@lists.infradead.org,
	linux-cifs@vger.kernel.org,
	linux-nfs@vger.kernel.org,
	ceph-devel@vger.kernel.org,
	v9fs@lists.linux.dev,
	linux-fsdevel@vger.kernel.org,
	linux-mm@kvack.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Steve French <sfrench@samba.org>,
	Shyam Prasad N <nspmangalore@gmail.com>,
	Rohith Surabattula <rohiths.msft@gmail.com>
Subject: [PATCH v2 45/51] cifs: Make wait_mtu_credits take size_t args
Date: Fri, 17 Nov 2023 21:15:37 +0000
Message-ID: <20231117211544.1740466-46-dhowells@redhat.com>
In-Reply-To: <20231117211544.1740466-1-dhowells@redhat.com>
References: <20231117211544.1740466-1-dhowells@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.9
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"; x-default=true
X-Original-Sender: dhowells@redhat.com
X-Original-Authentication-Results: mx.google.com;       spf=pass (google.com:
 domain gapps.redhat.com configured 207.211.31.120 as internal address) smtp.mailfrom=dhowells@redhat.com
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
cc: linux-fsdevel@vger.kernel.org
cc: linux-mm@kvack.org
---
 fs/smb/client/cifsglob.h  |  4 ++--
 fs/smb/client/cifsproto.h |  2 +-
 fs/smb/client/file.c      | 18 ++++++++++--------
 fs/smb/client/smb2ops.c   |  4 ++--
 fs/smb/client/transport.c |  4 ++--
 5 files changed, 17 insertions(+), 15 deletions(-)

diff --git a/fs/smb/client/cifsglob.h b/fs/smb/client/cifsglob.h
index 9c2bb0fc58e8..e02044f0f458 100644
--- a/fs/smb/client/cifsglob.h
+++ b/fs/smb/client/cifsglob.h
@@ -507,8 +507,8 @@ struct smb_version_operations {
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
index be46efbbf7ac..824a84f14f4a 100644
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
index 497429eec942..7621eb7a544d 100644
--- a/fs/smb/client/file.c
+++ b/fs/smb/client/file.c
@@ -2733,9 +2733,9 @@ static ssize_t cifs_write_back_from_locked_folio(struct address_space *mapping,
 	struct cifs_credits credits_on_stack;
 	struct cifs_credits *credits = &credits_on_stack;
 	struct cifsFileInfo *cfile = NULL;
-	unsigned int xid, wsize, len;
+	unsigned int xid, len;
 	loff_t i_size = i_size_read(inode);
-	size_t max_len;
+	size_t max_len, wsize;
 	long count = wbc->nr_to_write;
 	int rc;
 
@@ -3247,7 +3247,7 @@ static int
 cifs_resend_wdata(struct cifs_io_subrequest *wdata, struct list_head *wdata_list,
 	struct cifs_aio_ctx *ctx)
 {
-	unsigned int wsize;
+	size_t wsize;
 	struct cifs_credits credits;
 	int rc;
 	struct TCP_Server_Info *server = wdata->server;
@@ -3381,7 +3381,8 @@ cifs_write_from_iter(loff_t fpos, size_t len, struct iov_iter *from,
 	do {
 		struct cifs_credits credits_on_stack;
 		struct cifs_credits *credits = &credits_on_stack;
-		unsigned int wsize, nsegs = 0;
+		unsigned int nsegs = 0;
+		size_t wsize;
 
 		if (signal_pending(current)) {
 			rc = -EINTR;
@@ -3818,7 +3819,7 @@ static int cifs_resend_rdata(struct cifs_io_subrequest *rdata,
 			struct list_head *rdata_list,
 			struct cifs_aio_ctx *ctx)
 {
-	unsigned int rsize;
+	size_t rsize;
 	struct cifs_credits credits;
 	int rc;
 	struct TCP_Server_Info *server;
@@ -3892,10 +3893,10 @@ cifs_send_async_read(loff_t fpos, size_t len, struct cifsFileInfo *open_file,
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
@@ -4491,12 +4492,13 @@ static void cifs_readahead(struct readahead_control *ractl)
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
index 5d8566ba4d20..d80026a50f62 100644
--- a/fs/smb/client/smb2ops.c
+++ b/fs/smb/client/smb2ops.c
@@ -216,8 +216,8 @@ smb2_get_credits(struct mid_q_entry *mid)
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
index 3048516573e8..5cf653463c55 100644
--- a/fs/smb/client/transport.c
+++ b/fs/smb/client/transport.c
@@ -684,8 +684,8 @@ wait_for_compound_request(struct TCP_Server_Info *server, int num,
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

