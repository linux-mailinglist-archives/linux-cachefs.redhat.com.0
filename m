Return-Path: <linux-cachefs+bncBDLIXLMFVAERBP7XYOYQMGQETAHSK2A@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from mail-yb1-f198.google.com (mail-yb1-f198.google.com [209.85.219.198])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FBED8B7871
	for <lists+linux-cachefs@lfdr.de>; Tue, 30 Apr 2024 16:10:09 +0200 (CEST)
Received: by mail-yb1-f198.google.com with SMTP id 3f1490d57ef6-de617c7649dsf1059071276.0
        for <lists+linux-cachefs@lfdr.de>; Tue, 30 Apr 2024 07:10:09 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1714486208; cv=pass;
        d=google.com; s=arc-20160816;
        b=UZ8iUMAn2NV8vNusAOO0I/StUBbO5EVX3aItwzdjCnnhvN4SjSX4NjHlW5nI42TsMf
         aP/8plM7Em3lBumb56KBIFSEMmxr/mL0+gGmbBdGny3IeWBOdvcPJB0hutOAQVUk8ygd
         jeu+lWyTEiMllfZaLe7QXtcfNqfNDgaAjcSaDdd2JAWM8DFmlREsFDjm+N94NOmUS1dK
         L8OrkRMHPBAWdT15D9kTAPcUkiP3EmCLYxAXbOZakqqmW10R8l6+eoD7RlejUlr8PzrU
         uELSrNlxhppeI78p16hGsR9UWJ2PEsQvazu4lTDKphC59DXqnTAO7Bj7UbVu0gvZz8+5
         gizw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-archive:list-help:list-post:list-id
         :mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:delivered-to;
        bh=2RIG4iIW6hS+CjhOD4jof3UmjfHMpGpmo5M18GSTi/A=;
        fh=8QN0YEfVJHY9P6jxNPA3ZFrSoa5OI8e5mRQZMsifkaA=;
        b=AHrDi2nFS4rsmsXbd/VUsjaAS6+3hvoZzaL6AbZu57TqfS5Iymp7JOrzbNY08MIMVK
         9t2eaI9mSetKHg8qjIW0/Q1GD9y5lLv3Slxa35d75lGxgy5c0VVaUCW5i3ix3+WRNnIx
         CHI6gVnw4COKQ7tP9+kkre+CC2nzoezcIrPzSYyd4fRL/O3riOrNQ5RAd3zILEQskaaW
         8ongzTmZ+hE4OYd/vPGItHguC9hTZIDpv2NHSnioVuP51a7M4DbU0C4h05L1ZFI7uOzf
         Eqbon4//Q4vRVJI01iHQXQoK6N3jvscwf/kQocqrxj0e6J8ev8yFrn4SWwBftDORORg/
         6zcg==;
        darn=lfdr.de
ARC-Authentication-Results: i=2; mx.google.com;
       gateway.spf=pass (google.com: domain gapps.redhat.com configured 170.10.128.131 as internal address) smtp.mailfrom=dhowells@redhat.com smtp.remote-ip=170.10.128.131 policy.d=gapps.redhat.com
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714486208; x=1715091008;
        h=list-unsubscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender:mime-version
         :references:in-reply-to:message-id:date:subject:cc:to:from
         :delivered-to:x-beenthere:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2RIG4iIW6hS+CjhOD4jof3UmjfHMpGpmo5M18GSTi/A=;
        b=bTfd8qxg+P41SpzY2AjLmjHK+jkPWVNq5SgiTJcwkCDEmg/JY81ZS1zWJdFnBNrx4d
         v2FKSlyxg7I/vxJlbffmEGuzhov205e2zfe1aJ1A1Ui4isa8xq2g7uo1jxLMhw+VDgWC
         LpCOM5y4WBMIzosvUEBEc4bSlxboh0Vjy6DknxOyk18ohOxbgqCcCFw3vqlNUnHJLmEE
         mLhoSuXawZCEgxaYAuAfyc0bK+9wACTvbEqEa2jM+54fn3FJqUfh+ju7Xa88z2uXcnB8
         goj7GGDkCqVBYJP0KCK/c1pt2akoTMPltxiob1b8LSJpR0lXlGCtPpHrXkjm+qz+g38P
         95BA==
X-Forwarded-Encrypted: i=2; AJvYcCWpEgdxDaFyE2kWeeccotASsBCfeIy/lwRG5DrGnxbuDyOJ0gaevitSL717RaONNTd9XIwG3bKFkA+3b0AZ8QDNzGL8bm/Xl06K6lM=
X-Gm-Message-State: AOJu0YzCYj+B6DXMduzy6CiF+XPQymTBa1Yh7Ked65TrFy9RSQcadWbf
	IYkPor/rE2C+CqYJQwyVaZ8uHhHef04/K5tNT3LzKxyog5TCEJRbNW5G8buBRMY=
X-Google-Smtp-Source: AGHT+IHKyU0bEQB8zqNfexCqDHErgsmLuHBhuBNk3LaCEsXnVz2bMxMWSHCeiCxHCgBSKpyKwS/Hjg==
X-Received: by 2002:a25:d88f:0:b0:de6:1992:e633 with SMTP id p137-20020a25d88f000000b00de61992e633mr1573080ybg.22.1714486208099;
        Tue, 30 Apr 2024 07:10:08 -0700 (PDT)
X-BeenThere: linux-cachefs@redhat.com
Received: by 2002:a25:df87:0:b0:de5:a2c1:5cdd with SMTP id 3f1490d57ef6-de5a2c17514ls1317165276.1.-pod-prod-04-us;
 Tue, 30 Apr 2024 07:09:50 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXLYV3gslf10rBLP8yx3MR3KVfQ8xo3eWfljNpyZt1N2GaZfNiXOWXP1wQ48PL31nQLaswmFVqLSMYzh0xEAKWZy/ZtAuf+vU/TzdkZu2c=
X-Received: by 2002:a05:690c:600b:b0:61b:a7de:1f87 with SMTP id hf11-20020a05690c600b00b0061ba7de1f87mr13351406ywb.5.1714486189896;
        Tue, 30 Apr 2024 07:09:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1714486189; cv=none;
        d=google.com; s=arc-20160816;
        b=DjsCbCbdGh6VwtpVvsS6J+vc4yKrfIu1fvHdwTw0sJBs5SEae7PS6HMyAhQfHE4nRG
         xZ1Pg2puzWm5PDmOReCVbNJtXCqzuKX/WaPQbOiOANWBG6adnQPp7VIED9UgeF0Y6ew0
         MQe8qsNtBI0Nbyi279in5hp5jvg23q1Z7GDVVF28UFxTKdU4aKnVkuh2+lQSqHKvc0ZG
         4xjyOknTaYKIgmRfXQSueDb4SlZlQNF3axihSXrJkjeMEJR5k5pH+qKQkE955X3H3Waz
         /Wm0eewRoPd5h6KiLOsqB1Mn2QbNGFg0aR0AnX3/wug8iKbxyhsH38LgXnlE3RMg725c
         0JWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:delivered-to;
        bh=pA1Ck43J/tYdJooBNKollk8fJAowzlOC8m/UlfKUMqQ=;
        fh=hHKMMIwAr1y7rLiE+cxs1Jgq7jDNxiUKBu3HroapreE=;
        b=O+MIbwRhZtTuXi7gdTN+jkm7hs2pm9Y1oLvCX5cwxMCqcFCR6cEGT9IFwfAibGpYaI
         jAfPpK9HVne8/h2fH1Bj0V54Pq5ib8wcOM5ReD/kzwx/weBHp37I6QMhHq2Ll4Clh2MT
         Pnu56kydF0xj/CCkHcuahW0X9+pVADd2JyvOM/hXlZBdlIXzkm9xc32ODofwe+MvxlHy
         R9l0BwwDradM/IEsi96ab51lEGy68El8nVE13OGim4T38yaSWiUIFpDgzdckf70VmAOn
         HFFpf1PYfXz0QzUl0b0CDG9wIq0CzxVLrj02DIEpsmgcPbWeYRN10X0XcaHsU+cdie6w
         Mvsw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       gateway.spf=pass (google.com: domain gapps.redhat.com configured 170.10.128.131 as internal address) smtp.mailfrom=dhowells@redhat.com smtp.remote-ip=170.10.128.131 policy.d=gapps.redhat.com
Received: from us-smtp-inbound-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com. [170.10.128.131])
        by mx.google.com with ESMTPS id v31-20020a81b71f000000b0061be9dfb552si586581ywh.124.2024.04.30.07.09.49
        for <linux-cachefs@gapps.redhat.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Apr 2024 07:09:49 -0700 (PDT)
Received-SPF: pass (google.com: domain gapps.redhat.com configured 170.10.128.131 as internal address)
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-499-zqeVZ49WPXGP1jUPWWKi9A-1; Tue,
 30 Apr 2024 10:09:47 -0400
X-MC-Unique: zqeVZ49WPXGP1jUPWWKi9A-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8AFC129AC010
	for <linux-cachefs@gapps.redhat.com>; Tue, 30 Apr 2024 14:09:47 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
	id 88552581CC; Tue, 30 Apr 2024 14:09:47 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.com (unknown [10.42.28.22])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 3CC6F581C9;
	Tue, 30 Apr 2024 14:09:45 +0000 (UTC)
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
	linux-kernel@vger.kernel.org,
	Steve French <sfrench@samba.org>,
	Shyam Prasad N <nspmangalore@gmail.com>,
	Rohith Surabattula <rohiths.msft@gmail.com>,
	linux-cachefs@redhat.com
Subject: [PATCH v7 05/16] cifs: Make wait_mtu_credits take size_t args
Date: Tue, 30 Apr 2024 15:09:17 +0100
Message-ID: <20240430140930.262762-6-dhowells@redhat.com>
In-Reply-To: <20240430140930.262762-1-dhowells@redhat.com>
References: <20240430140930.262762-1-dhowells@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"; x-default=true
X-Original-Sender: dhowells@redhat.com
X-Original-Authentication-Results: mx.google.com;       gateway.spf=pass
 (google.com: domain gapps.redhat.com configured 170.10.128.131 as internal
 address) smtp.mailfrom=dhowells@redhat.com smtp.remote-ip=170.10.128.131 policy.d=gapps.redhat.com
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
index 5100aa047ed6..13161e0b5cc0 100644
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
index cb5cc5711a84..103f264b42d7 100644
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
index 7528f6436ec4..4d8cd0d82104 100644
--- a/fs/smb/client/file.c
+++ b/fs/smb/client/file.c
@@ -2783,7 +2783,8 @@ static ssize_t cifs_write_back_from_locked_folio(struct address_space *mapping,
 	struct cifs_credits *credits = &credits_on_stack;
 	struct cifsFileInfo *cfile = NULL;
 	unsigned long long i_size = i_size_read(inode), max_len;
-	unsigned int xid, wsize;
+	unsigned int xid;
+	size_t wsize;
 	size_t len = folio_size(folio);
 	long count = wbc->nr_to_write;
 	int rc;
@@ -3285,7 +3286,7 @@ static int
 cifs_resend_wdata(struct cifs_io_subrequest *wdata, struct list_head *wdata_list,
 	struct cifs_aio_ctx *ctx)
 {
-	unsigned int wsize;
+	size_t wsize;
 	struct cifs_credits credits;
 	int rc;
 	struct TCP_Server_Info *server = wdata->server;
@@ -3420,7 +3421,8 @@ cifs_write_from_iter(loff_t fpos, size_t len, struct iov_iter *from,
 	do {
 		struct cifs_credits credits_on_stack;
 		struct cifs_credits *credits = &credits_on_stack;
-		unsigned int wsize, nsegs = 0;
+		unsigned int nsegs = 0;
+		size_t wsize;
 
 		if (signal_pending(current)) {
 			rc = -EINTR;
@@ -3857,7 +3859,7 @@ static int cifs_resend_rdata(struct cifs_io_subrequest *rdata,
 			struct list_head *rdata_list,
 			struct cifs_aio_ctx *ctx)
 {
-	unsigned int rsize;
+	size_t rsize;
 	struct cifs_credits credits;
 	int rc;
 	struct TCP_Server_Info *server;
@@ -3931,10 +3933,10 @@ cifs_send_async_read(loff_t fpos, size_t len, struct cifsFileInfo *open_file,
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
@@ -4530,12 +4532,13 @@ static void cifs_readahead(struct readahead_control *ractl)
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
index c13705c0e47f..ef18cd30f66c 100644
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
index cccc1248c48a..4c8af995c60b 100644
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

To unsubscribe from this group and stop receiving emails from it, send an email to linux-cachefs+unsubscribe@redhat.com.

