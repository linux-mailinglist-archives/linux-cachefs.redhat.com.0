Return-Path: <linux-cachefs+bncBDLIXLMFVAERBDGY6SWAMGQER5M3NVA@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from mail-yb1-f199.google.com (mail-yb1-f199.google.com [209.85.219.199])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B2EC8284AC
	for <lists+linux-cachefs@lfdr.de>; Tue,  9 Jan 2024 12:20:46 +0100 (CET)
Received: by mail-yb1-f199.google.com with SMTP id 3f1490d57ef6-dbdac466edcsf2860890276.2
        for <lists+linux-cachefs@lfdr.de>; Tue, 09 Jan 2024 03:20:46 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1704799245; cv=pass;
        d=google.com; s=arc-20160816;
        b=FRdOVak/e3UthNVcDOpGfW0srposBl8iGgo09eC7urh4AnyQR6n9WmnNFgW10Bh120
         uQaGDTqrnLW3srQyZ2MGvDwZ7se4vs4dIkjgRnFzbYcxiIxYLy7kc1ivaj7QajdJ7bOv
         /ZAq+pYpor5B7ZdV2dSwb08pxt8ZnOMwLtQUm4RgrX69z22d6XjdQzDJ/Dlb/Ndwjsf2
         GKyj/FsdncwVwQKVSKiN/jTuyzTJlITucv8a3UYEoMAC1yH2q8gMonwEm5XUyviwM2en
         jf8J05hyCt9zvuNqdSGq8FSQ1DFWLgC13vzJQhHHQkE0FyBCauFkAcfewHgNduUQwOKL
         afmw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-archive:list-help:list-post:list-id
         :mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:delivered-to;
        bh=J03+dZYJPRME6nQij45ZPTfzEM4oCvXxQ29e4lfnJYU=;
        fh=wHeWnRAPvg2xJ56RgmOMhm93PiD0Bj1H5ZiEjecP7fw=;
        b=JQZy0kh36RTr3THZnCe+b9j1aTbzAyLIt3SkYaxqupBoNhtZELoirsQWDwqkiFa8ja
         BhWq1H6p8hDn+lz0pencunK3JDYHX7W04tw6rfDubTkJ9efExPBybBlB4h+V38JPPJyE
         cZcQWjQtYH9dor6ffp9uW95EaPHnOTPoCyXCeXW6NZC7t5qsQ1lDBL58B1Kfvy9Vp4S1
         9TzyKwAPABT4m895ijrLcF36mKcf0VxD8fnfQBzD4HYIHdOXBXf+lpqlvAi3O0a1erz4
         h0VwsLLesUPJpNVu1Q9pfvL97GohO5vn66EFHVDtZIxepKSEE5c03HHm9aqKvxHFKvKU
         g9Fw==
ARC-Authentication-Results: i=2; mx.google.com;
       gateway.spf=pass (google.com: domain gapps.redhat.com configured 207.211.31.120 as internal address) smtp.mailfrom=dhowells@redhat.com smtp.remote-ip=207.211.31.120 policy.d=gapps.redhat.com
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704799245; x=1705404045;
        h=list-unsubscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender:mime-version
         :references:in-reply-to:message-id:date:subject:cc:to:from
         :delivered-to:x-beenthere:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=J03+dZYJPRME6nQij45ZPTfzEM4oCvXxQ29e4lfnJYU=;
        b=nBxRbrplRuuCWVYgm55q90K0YJDqVAQQeh+mYLSPnsn/R0irVPjj/kl2SdjIHt0ywF
         G/w1rDrbm/G44Iuk/1xcfLI1SYKwmbFaYU1Uhe/OUzKzMOnqzNICoclnjP/hBQNetGg/
         7ZzNPVUQnp3MM0II3G3o74EL+fDAOGd4zEcUIX4lPr13IEzK0l9ASp4ptCp7APmkObLD
         Te4PH3XhjhKKRfCmQbGZh0w9H4N9jl/3gg61hqXtVZHKYDOqiWNpSOgCsTc/PNrmZuM4
         NBMSckgRqAOQpbVIs6Ip3ULE10GdY9SuJd4XKtoNqKWo6sd2VSv8het5YZgF1uEcChJ8
         08uQ==
X-Gm-Message-State: AOJu0YzMVqdxneq19MimaJLqvmiEf69oVvWQDxZlmM5MA+jhA6G5QQOm
	kPVkv1Mmmm6XHNlBsTYdszrKnqAc+Ml51A==
X-Google-Smtp-Source: AGHT+IFvzze6u83WACHzyI93Mgu7aiwnVtL1ru1SWYqRzjPhc3Jvl4c0wVCgfuqGtKz8mOZp2DaYww==
X-Received: by 2002:a05:6902:4ed:b0:dbe:ac6b:7266 with SMTP id w13-20020a05690204ed00b00dbeac6b7266mr2561212ybs.12.1704799244946;
        Tue, 09 Jan 2024 03:20:44 -0800 (PST)
X-BeenThere: linux-cachefs@redhat.com
Received: by 2002:a25:d243:0:b0:dbe:9f91:75e9 with SMTP id j64-20020a25d243000000b00dbe9f9175e9ls2081152ybg.0.-pod-prod-01-us;
 Tue, 09 Jan 2024 03:20:44 -0800 (PST)
X-Received: by 2002:a25:bc86:0:b0:dbd:b8d4:a414 with SMTP id e6-20020a25bc86000000b00dbdb8d4a414mr2149676ybk.59.1704799244366;
        Tue, 09 Jan 2024 03:20:44 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1704799244; cv=none;
        d=google.com; s=arc-20160816;
        b=guQOzUvr23d/NeD9Mk7KyTaxXDFvjUdjK7xE6ZsIFGsOCgfbEY5pbj2f0o17eBb3cr
         sEnkq+yOI4ZhU2IG+jO6quKnqqruK5LXPQJsUGLGUyv7W1HNkVIIl0i2AUxaDHSQCCrd
         wEV6sXNvfXC2PhUtzWapexEnrbaLy4oxCaJBKnldMFVrAKGMPxlh6LCKMXqCObIoflB9
         uWGf6L/zEDL0GlUOCdojRKcJ7yghRuvO8PON0ifRfM2ERCvrBdXaCmm9HUcm7/Vwk/Fk
         v8gBfdYROhpMERO9U8Tn2w+wM23hhST8UTJJW5mlIHS554n1nQHQH1k5tYW8CxjY9N6+
         UBAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:delivered-to;
        bh=rr5EJ/KUtWAGcPxbo/TizcNZKdZiXnS9Nbdtw3WvDek=;
        fh=wHeWnRAPvg2xJ56RgmOMhm93PiD0Bj1H5ZiEjecP7fw=;
        b=O+7CIIuLHbolQ42ZzzM1Brqc3HhfjLBfHFXkLGvUB2ej1xOsxYFS5qHZeJN/bPDaqT
         +i+hWRWa7LYgzbgKoHK0ml5AggUvognv73tdYFm65qCrnJk4qBfOsWADCmaGuiWIGTtz
         47oHD/v2+Z4qvoM+zrQrQDfMfciGGOrhyEt7ox23WsJfOBZzeIQz57M3blIaNqWsX7fD
         x/ycEQM/AR3CBQMOmne+NduYn28YRln8t2aKCCJapnJgbG4r/+ucMfiiUJMM/pE7mZeC
         LP/755eCdsMW8dtY+CDIssaXuHFixJVoXIK7PZzFnxOISZuQUEJXLwm9pEitw3V18nad
         r8Xg==
ARC-Authentication-Results: i=1; mx.google.com;
       gateway.spf=pass (google.com: domain gapps.redhat.com configured 207.211.31.120 as internal address) smtp.mailfrom=dhowells@redhat.com smtp.remote-ip=207.211.31.120 policy.d=gapps.redhat.com
Received: from us-smtp-inbound-delivery-1.mimecast.com (us-smtp-inbound-delivery-1.mimecast.com. [207.211.31.120])
        by mx.google.com with ESMTPS id f186-20020a251fc3000000b00dbee51cd187si807313ybf.112.2024.01.09.03.20.44
        for <linux-cachefs@gapps.redhat.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jan 2024 03:20:44 -0800 (PST)
Received-SPF: pass (google.com: domain gapps.redhat.com configured 207.211.31.120 as internal address)
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-381-CJbImFjCMxaZ7oJPFlGvvA-1; Tue,
 09 Jan 2024 06:20:42 -0500
X-MC-Unique: CJbImFjCMxaZ7oJPFlGvvA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 61BFB1C0650A
	for <linux-cachefs@gapps.redhat.com>; Tue,  9 Jan 2024 11:20:42 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
	id 5C64CC15E6A; Tue,  9 Jan 2024 11:20:42 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.com (unknown [10.42.28.67])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 7E2DBC15A0C;
	Tue,  9 Jan 2024 11:20:39 +0000 (UTC)
From: David Howells <dhowells@redhat.com>
To: Christian Brauner <christian@brauner.io>,
	Jeff Layton <jlayton@kernel.org>,
	Gao Xiang <hsiangkao@linux.alibaba.com>,
	Dominique Martinet <asmadeus@codewreck.org>
Cc: David Howells <dhowells@redhat.com>,
	Steve French <smfrench@gmail.com>,
	Matthew Wilcox <willy@infradead.org>,
	Marc Dionne <marc.dionne@auristor.com>,
	Paulo Alcantara <pc@manguebit.com>,
	Shyam Prasad N <sprasad@microsoft.com>,
	Tom Talpey <tom@talpey.com>,
	Eric Van Hensbergen <ericvh@kernel.org>,
	Ilya Dryomov <idryomov@gmail.com>,
	linux-cachefs@redhat.com,
	linux-afs@lists.infradead.org,
	linux-cifs@vger.kernel.org,
	linux-nfs@vger.kernel.org,
	ceph-devel@vger.kernel.org,
	v9fs@lists.linux.dev,
	linux-erofs@lists.ozlabs.org,
	linux-fsdevel@vger.kernel.org,
	linux-mm@kvack.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/6] netfs: Mark netfs_unbuffered_write_iter_locked() static
Date: Tue,  9 Jan 2024 11:20:18 +0000
Message-ID: <20240109112029.1572463-2-dhowells@redhat.com>
In-Reply-To: <20240109112029.1572463-1-dhowells@redhat.com>
References: <20240109112029.1572463-1-dhowells@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.8
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

Mark netfs_unbuffered_write_iter_locked() static as it's only called from
the file in which it is defined.

Signed-off-by: David Howells <dhowells@redhat.com>
cc: Jeff Layton <jlayton@kernel.org>
cc: linux-cachefs@redhat.com
cc: linux-fsdevel@vger.kernel.org
cc: linux-mm@kvack.org
---
 fs/netfs/direct_write.c | 4 ++--
 fs/netfs/internal.h     | 6 ------
 2 files changed, 2 insertions(+), 8 deletions(-)

diff --git a/fs/netfs/direct_write.c b/fs/netfs/direct_write.c
index aad05f2349a4..b9cbfd6a8a01 100644
--- a/fs/netfs/direct_write.c
+++ b/fs/netfs/direct_write.c
@@ -27,8 +27,8 @@ static void netfs_cleanup_dio_write(struct netfs_io_request *wreq)
  * Perform an unbuffered write where we may have to do an RMW operation on an
  * encrypted file.  This can also be used for direct I/O writes.
  */
-ssize_t netfs_unbuffered_write_iter_locked(struct kiocb *iocb, struct iov_iter *iter,
-					   struct netfs_group *netfs_group)
+static ssize_t netfs_unbuffered_write_iter_locked(struct kiocb *iocb, struct iov_iter *iter,
+						  struct netfs_group *netfs_group)
 {
 	struct netfs_io_request *wreq;
 	unsigned long long start = iocb->ki_pos;
diff --git a/fs/netfs/internal.h b/fs/netfs/internal.h
index d2d63120ac60..a6dfc8888377 100644
--- a/fs/netfs/internal.h
+++ b/fs/netfs/internal.h
@@ -26,12 +26,6 @@ void netfs_rreq_unlock_folios(struct netfs_io_request *rreq);
 int netfs_prefetch_for_write(struct file *file, struct folio *folio,
 			     size_t offset, size_t len);
 
-/*
- * direct_write.c
- */
-ssize_t netfs_unbuffered_write_iter_locked(struct kiocb *iocb, struct iov_iter *iter,
-					   struct netfs_group *netfs_group);
-
 /*
  * io.c
  */

-- 
You received this message because you are subscribed to the Google Groups "linux-cachefs@redhat.com" group.
To unsubscribe from this group and stop receiving emails from it, send an email to linux-cachefs+unsubscribe@redhat.com.

