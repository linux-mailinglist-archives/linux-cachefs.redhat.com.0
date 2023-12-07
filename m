Return-Path: <linux-cachefs+bncBDLIXLMFVAERBA7QZCVQMGQE7KRRPQY@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from mail-oa1-f71.google.com (mail-oa1-f71.google.com [209.85.160.71])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AC46809387
	for <lists+linux-cachefs@lfdr.de>; Thu,  7 Dec 2023 22:24:20 +0100 (CET)
Received: by mail-oa1-f71.google.com with SMTP id 586e51a60fabf-1fb19c0c5d0sf2376304fac.3
        for <lists+linux-cachefs@lfdr.de>; Thu, 07 Dec 2023 13:24:20 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1701984259; cv=pass;
        d=google.com; s=arc-20160816;
        b=rswGmYp7ouzPO9+Ph94H1LTZicfddD4rGxyN1DpKnx9mhSwnDR4WtU/K0R8KBPLgGN
         cawgVG9fyuQacI2UebFVUca+MZy92Pgbzelt0jij8/iaj5bMC/r1uJjLkJqOaSpbyuKH
         Kfxr8wrMD6GuEn/yDTViGSEsN7Yy6wcvch1bf9wrBKONojNDV+ZzPLZF7eM8FkLBEJwe
         4GvqjhBYYIYsMxYcms4ar31wsN9kvLr5+pOCfhsGfosBD1HLsSmM7oeVBYazGPOrA9p4
         H69B58uyCkiAXcJBdOU9fvQBl9bQK3j6bNPu4zCPC6BtWoZtFueG6PvbGqoAiDDqV+X1
         wo7g==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-archive:list-help:list-post:list-id
         :mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:delivered-to;
        bh=M12z/TAHE2+gSmUbZUGqsgFLq+ZmjbCh9frGcHU+c+Y=;
        fh=ib4gl95HfLmZdfX9QIMf3rTepWCH9JlNymcDKJTPhJg=;
        b=MNIKly6XKiltbOjm+RAwwf5TVJpEjWjJ5NuA4boFwVtpiUvgF9o3SB7CeQocfk5Pk8
         PSqkn2cj5kZwabh1WBUAy5bhaNxHpuZ9tvpqIbR1ZUm+JuyZSiPSY1h/q+uzElSK4iuh
         6kclTW0nUQaCi1U0xmHRR4ckMDT4r9H1CTkKj8cL/end+G7peDRjKIgfmOUH0ssrPgQJ
         Nz31c1NhjA5zCX6ZNK3KvWo+EiVLQRG4TC9Kvk0D183WZegEcmXsgqxa4FDhsswDRWD9
         mtd4toU6HeS/qXuPYI7asoN6s5loRPGA8rSrS93pm3CAnxqHW7ihqlMHapvrEdO4YT0i
         xjYw==
ARC-Authentication-Results: i=2; mx.google.com;
       gateway.spf=pass (google.com: domain gapps.redhat.com configured 207.211.31.120 as internal address) smtp.mailfrom=dhowells@redhat.com smtp.remote-ip=207.211.31.120 policy.d=gapps.redhat.com
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701984259; x=1702589059;
        h=list-unsubscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender:mime-version
         :references:in-reply-to:message-id:date:subject:cc:to:from
         :delivered-to:x-beenthere:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=M12z/TAHE2+gSmUbZUGqsgFLq+ZmjbCh9frGcHU+c+Y=;
        b=k0NGMrWZONnbKZQqrx+TVRRCmEaDsEUUA0U5nnEIFeiGX+26x6BxvU9lEQcMBD8NBb
         kpEbJPUIwi50bQwf+DyeJZJLxAQvQVzked6PbkJmmzs7QQ8+aJ/pS5d/CIGCzuDV+HMk
         Dwr0Omr3gPMp1ClQD5hZtHsQf6JJid1wIhzOqDueBYvQQ/2adI+d39Wp9oCaRU8s2CRm
         9QjNMc3WvYXhUhxSbYL4iaQw8gPABI6MIo0prDkzEvIIXTPx6oX8cUzPMsjJKLpPAarR
         0i4seOugButahaLmc8s3O1c0i5p89lzHFC9NtCddFWWJKvC0BMSj9lJ8Qprj/yAZ0lkw
         8iFA==
X-Gm-Message-State: AOJu0YxGDa7UdEIT/1pBgMgkoCc63pP3+W7tiGQ0rtvCkZG1v4NBwnDR
	6KJ3YqXyhTA5aevT20kW3K65dA==
X-Google-Smtp-Source: AGHT+IFMbCnk9hG1WdVtG0B721kmUWQOrEMwU5GISKt46G9xXb0rB14KLdaxoMFvcmUTJpwr9B2t+w==
X-Received: by 2002:a05:6870:17a7:b0:1fb:75b:2fcb with SMTP id r39-20020a05687017a700b001fb075b2fcbmr3433543oae.98.1701984259342;
        Thu, 07 Dec 2023 13:24:19 -0800 (PST)
X-BeenThere: linux-cachefs@redhat.com
Received: by 2002:ad4:4e10:0:b0:67a:94b0:82e3 with SMTP id dl16-20020ad44e10000000b0067a94b082e3ls1216520qvb.0.-pod-prod-07-us;
 Thu, 07 Dec 2023 13:24:18 -0800 (PST)
X-Received: by 2002:a0c:f888:0:b0:67a:6343:3049 with SMTP id u8-20020a0cf888000000b0067a63433049mr3115075qvn.45.1701984258793;
        Thu, 07 Dec 2023 13:24:18 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1701984258; cv=none;
        d=google.com; s=arc-20160816;
        b=QvBdhRVTVAYL9gGCqrs99QEffTATBPLQ6IKd/SmO3i5ihUyOYYILz6cHvg9kMsp6A3
         WsqXThEizRRLjbVMdr+9jxv9kXEDZQJaB0AYpdnch6tRXNpdTMgGVbAauXBA5XT1Ojc+
         TX09rMj+Wn97kNIiwbICLof3ZkHujHZajByOcTNGBF+rMb2oSAkXX5wATD3EvLGoMF0M
         367HhFsUTkzv51TfO3DKUCd9V7VRSVEsNef9Eys+8J+hhEA71zk37VD9RF/6094b6Uap
         GrqtYDQ6U+5uIa3jtJfln0mSeEzsUcM4GoKrmSOnelmz1BN+AkeZLHRJnrsmhTgeDny3
         ckEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:delivered-to;
        bh=C7Yf3Gyz2poDrlJ/i6bRFpW4r3T86H5wARr3qsse2RM=;
        fh=ib4gl95HfLmZdfX9QIMf3rTepWCH9JlNymcDKJTPhJg=;
        b=t5DCPIAUI8e5dkjILgaOiYJ4xgNfXCowLn/2xHru19A75my99MeVIbWklHOnJF2Fi/
         v3Po8nE16x+VZHkmKHKM8mzw5r0GxXUkvuFUML+V2090xXEvryphOngrTNkQttNSuptj
         gWoHoX7BecTLau2lLtMCYLxgKSmEUPHeEejd6pFZxsy7hD4MgNz2XS+EBApXFRadcDF+
         d940zmk2Ha4U9Zmu/xK9WoFVO5KxCMduypx48ejDcpo5pxZqMTOcAyIJ0sgp7gibW/3O
         5j7CpgCbUr1XBsJOJCx/GpEe+NjYU5bRBGeOirZOZBGLAuSLY9sY3L0XyiqnxuPqgo0l
         wrYw==
ARC-Authentication-Results: i=1; mx.google.com;
       gateway.spf=pass (google.com: domain gapps.redhat.com configured 207.211.31.120 as internal address) smtp.mailfrom=dhowells@redhat.com smtp.remote-ip=207.211.31.120 policy.d=gapps.redhat.com
Received: from us-smtp-inbound-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com. [207.211.31.120])
        by mx.google.com with ESMTPS id y11-20020ad4530b000000b0067aa61f75bcsi619772qvr.394.2023.12.07.13.24.18
        for <linux-cachefs@gapps.redhat.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Dec 2023 13:24:18 -0800 (PST)
Received-SPF: pass (google.com: domain gapps.redhat.com configured 207.211.31.120 as internal address)
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-377-F6OKb6zENqGy_b630f7Q9Q-1; Thu, 07 Dec 2023 16:24:15 -0500
X-MC-Unique: F6OKb6zENqGy_b630f7Q9Q-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id AD211185A78F
	for <linux-cachefs@gapps.redhat.com>; Thu,  7 Dec 2023 21:24:15 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
	id A9A031C060BC; Thu,  7 Dec 2023 21:24:15 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.com (unknown [10.42.28.161])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 1024B1C060AF;
	Thu,  7 Dec 2023 21:24:12 +0000 (UTC)
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
	Eric Van Hensbergen <ericvh@kernel.org>,
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
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 36/59] netfs: Make netfs_skip_folio_read() take account of blocksize
Date: Thu,  7 Dec 2023 21:21:43 +0000
Message-ID: <20231207212206.1379128-37-dhowells@redhat.com>
In-Reply-To: <20231207212206.1379128-1-dhowells@redhat.com>
References: <20231207212206.1379128-1-dhowells@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.7
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

Make netfs_skip_folio_read() take account of blocksize such as crypto
blocksize.

Signed-off-by: David Howells <dhowells@redhat.com>
cc: Jeff Layton <jlayton@kernel.org>
cc: linux-cachefs@redhat.com
cc: linux-fsdevel@vger.kernel.org
cc: linux-mm@kvack.org
---
 fs/netfs/buffered_read.c | 32 +++++++++++++++++++++-----------
 1 file changed, 21 insertions(+), 11 deletions(-)

diff --git a/fs/netfs/buffered_read.c b/fs/netfs/buffered_read.c
index 0d47e5ea6870..8b27ef2e78ca 100644
--- a/fs/netfs/buffered_read.c
+++ b/fs/netfs/buffered_read.c
@@ -331,6 +331,7 @@ EXPORT_SYMBOL(netfs_read_folio);
 
 /*
  * Prepare a folio for writing without reading first
+ * @ctx: File context
  * @folio: The folio being prepared
  * @pos: starting position for the write
  * @len: length of write
@@ -344,32 +345,41 @@ EXPORT_SYMBOL(netfs_read_folio);
  * If any of these criteria are met, then zero out the unwritten parts
  * of the folio and return true. Otherwise, return false.
  */
-static bool netfs_skip_folio_read(struct folio *folio, loff_t pos, size_t len,
-				 bool always_fill)
+static bool netfs_skip_folio_read(struct netfs_inode *ctx, struct folio *folio,
+				  loff_t pos, size_t len, bool always_fill)
 {
 	struct inode *inode = folio_inode(folio);
-	loff_t i_size = i_size_read(inode);
+	loff_t i_size = i_size_read(inode), low, high;
 	size_t offset = offset_in_folio(folio, pos);
 	size_t plen = folio_size(folio);
+	size_t min_bsize = 1UL << ctx->min_bshift;
+
+	if (likely(min_bsize == 1)) {
+		low = folio_file_pos(folio);
+		high = low + plen;
+	} else {
+		low = round_down(pos, min_bsize);
+		high = round_up(pos + len, min_bsize);
+	}
 
 	if (unlikely(always_fill)) {
-		if (pos - offset + len <= i_size)
-			return false; /* Page entirely before EOF */
+		if (low < i_size)
+			return false; /* Some part of the block before EOF */
 		zero_user_segment(&folio->page, 0, plen);
 		folio_mark_uptodate(folio);
 		return true;
 	}
 
-	/* Full folio write */
-	if (offset == 0 && len >= plen)
+	/* Full page write */
+	if (pos == low && high == pos + len)
 		return true;
 
-	/* Page entirely beyond the end of the file */
-	if (pos - offset >= i_size)
+	/* pos beyond last page in the file */
+	if (low >= i_size)
 		goto zero_out;
 
 	/* Write that covers from the start of the folio to EOF or beyond */
-	if (offset == 0 && (pos + len) >= i_size)
+	if (pos == low && (pos + len) >= i_size)
 		goto zero_out;
 
 	return false;
@@ -448,7 +458,7 @@ int netfs_write_begin(struct netfs_inode *ctx,
 	 * to preload the granule.
 	 */
 	if (!netfs_is_cache_enabled(ctx) &&
-	    netfs_skip_folio_read(folio, pos, len, false)) {
+	    netfs_skip_folio_read(ctx, folio, pos, len, false)) {
 		netfs_stat(&netfs_n_rh_write_zskip);
 		goto have_folio_no_wait;
 	}

-- 
You received this message because you are subscribed to the Google Groups "linux-cachefs@redhat.com" group.
To unsubscribe from this group and stop receiving emails from it, send an email to linux-cachefs+unsubscribe@redhat.com.

