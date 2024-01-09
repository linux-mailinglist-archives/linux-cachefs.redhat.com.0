Return-Path: <linux-cachefs+bncBDLIXLMFVAERBE6Y6SWAMGQEQGHMJOQ@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from mail-yw1-f197.google.com (mail-yw1-f197.google.com [209.85.128.197])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FB208284B0
	for <lists+linux-cachefs@lfdr.de>; Tue,  9 Jan 2024 12:20:53 +0100 (CET)
Received: by mail-yw1-f197.google.com with SMTP id 00721157ae682-5e7547e98f1sf43307827b3.1
        for <lists+linux-cachefs@lfdr.de>; Tue, 09 Jan 2024 03:20:53 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1704799252; cv=pass;
        d=google.com; s=arc-20160816;
        b=zZ2yHMsTZM0j2YeX+R8pvriMn2kN5sx4hhxhIF8nUsQajXln9iOJKn4Ajr09G2xdvS
         FJcznSRMUJf8OAjNzFW95p9e2gYO+g2HzGIVq309YZQKcpHq21NsDqaYKOBfu0QMftUO
         xHhaGXL48rbYHeuqtz6kfKXwPleD27qr5B1/aIipa41ETbRRLrAigEJDlfRxaZcLufK1
         +cFcxbCv3O0lkvChJWJ3c3YX6yqb7/idWskGWub5Mk8MPwj7CuT180wddX8c6JRp1NJj
         Y6fb1TQYhUhMIh498JK0I7m/sAC8u1W4qJVrWUFXI0JKGMqfT8V9EA5CQkFWzBX89COF
         yw5w==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-archive:list-help:list-post:list-id
         :mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:delivered-to;
        bh=YUKQwmJ+LsrE8qjuAt8F+Tt7V9GsgOXVYS0Q7cX6vJA=;
        fh=wHeWnRAPvg2xJ56RgmOMhm93PiD0Bj1H5ZiEjecP7fw=;
        b=d2QePL92HLO4d2Zo/Pt46coyyM0e9ePa6Y3sAq8LZ14wnZVfEdEj+pbbGvfHGjPBXH
         YHlOiGqjUw5s5O9erJdYYu8H7Kw1zw4n0O6iTMP2VxAK6gMsc1zxfIPh0jatcEWsyzRr
         pAjx9oTAxvLxEH3kO9POhiQPr2JZzPotSpdnrjpBvKnIFAsa1xhbTcqMoLh79z8eVYoG
         7hm4L/JgbnScKlHbBBBSq+5nUK0qBgwjDcShX7UDILs0yvn+GREfKmqky7fgrIbGj/Cq
         idTB7Idl9lNs5HEkEGdw0QOR8O7cmR9oG7xwMTxngNADiHRVeWGp+091DHC9dt43d5SV
         C9ig==
ARC-Authentication-Results: i=2; mx.google.com;
       gateway.spf=pass (google.com: domain gapps.redhat.com configured 207.211.31.120 as internal address) smtp.mailfrom=dhowells@redhat.com smtp.remote-ip=207.211.31.120 policy.d=gapps.redhat.com
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704799252; x=1705404052;
        h=list-unsubscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender:mime-version
         :references:in-reply-to:message-id:date:subject:cc:to:from
         :delivered-to:x-beenthere:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YUKQwmJ+LsrE8qjuAt8F+Tt7V9GsgOXVYS0Q7cX6vJA=;
        b=gqV62yhMrUFWtEu1f4oHXJNyKzo1l3SdMfDhxVav8llgJ3rgi0SoV48WxyDGIS4Zlk
         xkfgHxy+1PGL1dxZsS+H1c0mLR+IGvu2ym/DwCNMiXF0aD/Ab6tkCMgKqU4bYM4MetK0
         GukDSr0nk3ozJ/QvwriKMGT/0Ungz+Mkw/9Aot5UJIv3OIJ42DOQrgG5AD0srlUHuMso
         8DF0r5BKYwoHphDh+GwJFFK2akcelytTDkBhdqUTHxq7JIvX257Ra+vm4wnU4U34JXAW
         mXubAQbYx0WdLjKTt7cHuIodt9KMo8CTDk6RiNt13OFEXoYUpoiRCs75uO/IzjB25gbb
         UMQQ==
X-Gm-Message-State: AOJu0Yw86R1WVQH8U0FwvywnyFna/c2hxu3/WBVW0LeHzJ8fVaRpTpyM
	dHRLTKz77sraEzmBFxvSpHA/S09hVx/gGg==
X-Google-Smtp-Source: AGHT+IEZXVlrTdvnql5ScrXavi5twZRydKpswSTVMJ/Kvx7CLe2YMTaiLJO2i+dHFlXge8g371jH7g==
X-Received: by 2002:a25:c70e:0:b0:dbf:a73:b26e with SMTP id w14-20020a25c70e000000b00dbf0a73b26emr282481ybe.57.1704799251989;
        Tue, 09 Jan 2024 03:20:51 -0800 (PST)
X-BeenThere: linux-cachefs@redhat.com
Received: by 2002:a25:d7cc:0:b0:dbd:c1d9:dbc0 with SMTP id o195-20020a25d7cc000000b00dbdc1d9dbc0ls123330ybg.2.-pod-prod-00-us;
 Tue, 09 Jan 2024 03:20:51 -0800 (PST)
X-Received: by 2002:a25:83cf:0:b0:dbc:bb00:5f91 with SMTP id v15-20020a2583cf000000b00dbcbb005f91mr260522ybm.23.1704799251430;
        Tue, 09 Jan 2024 03:20:51 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1704799251; cv=none;
        d=google.com; s=arc-20160816;
        b=WHH7Zvu20UKym7tyryhwrrnAybe3/BbMY4+wit6sBVEGPOMGNDPLHtud6lRvW7PQe1
         1K60mZqtSm6QHxpbZ/ZYUBKrFIbRTpSuNWFTrsPxogMwJyNGhHNpkeL+1U5kkT2qznVG
         wJ3lk4Ys6L99+rOuIPqKj79B5ZuuZLFLk7drzYskAaZszA8y7fSqNHJlQTVe5DIFseM6
         24RXlyCGCmmfwxAPfwexdWrypD7QdEVw3DYsop1MAnFv1wFyXFDOP4td0wdo1IBYyp4u
         qBNc5qsY8RvoIhk8udaD/bCVjOKMCyGpED3Yh1kQ2Wi6gUCqY/DEo1DlkcRPKHx+EMiu
         7I1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:delivered-to;
        bh=fR5jKaj4zqBjWF982EotHFYbvpWpLhYokRvcwfgk5DQ=;
        fh=wHeWnRAPvg2xJ56RgmOMhm93PiD0Bj1H5ZiEjecP7fw=;
        b=pwjd9sEVNPBBNrG7Jjmn+YWwiKtDqz4wtjbdRlPKfgGIZYYtgH67C4tlFv5JmdupQh
         MGcFBNtNnxZB2uG6VBQ65TO7xyQ0g/5Q7ZWrqYpyWjK6BHbaxergNvJQbVTC4mTJhs/e
         V0yYGx0nEiMKmVabGsZ9cKADWqheq4fdGCXf5uo78KUfpER6mDJ30nqzukpqIzJEsHdI
         nOvWtCuET8CSxD9UvisK1buivaa3HNHHveZ6YAZJYfRaAZHMy34ftToY2PRSyzJbgB00
         7opodVLcHKadYtrKESNvHObTvCeJELlasBOe0XDGKY8ptQM9rc4YrDD8zr8/Xx9/wZBw
         /QeQ==
ARC-Authentication-Results: i=1; mx.google.com;
       gateway.spf=pass (google.com: domain gapps.redhat.com configured 207.211.31.120 as internal address) smtp.mailfrom=dhowells@redhat.com smtp.remote-ip=207.211.31.120 policy.d=gapps.redhat.com
Received: from us-smtp-inbound-delivery-1.mimecast.com (us-smtp-inbound-delivery-1.mimecast.com. [207.211.31.120])
        by mx.google.com with ESMTPS id r40-20020a25ac68000000b00dbddeb9748bsi958266ybd.16.2024.01.09.03.20.51
        for <linux-cachefs@gapps.redhat.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jan 2024 03:20:51 -0800 (PST)
Received-SPF: pass (google.com: domain gapps.redhat.com configured 207.211.31.120 as internal address)
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-167-IyS-uYrpN9OoLSMuNyHxnA-1; Tue, 09 Jan 2024 06:20:49 -0500
X-MC-Unique: IyS-uYrpN9OoLSMuNyHxnA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 87E6A85A59C
	for <linux-cachefs@gapps.redhat.com>; Tue,  9 Jan 2024 11:20:49 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
	id 7D8FC1C060B2; Tue,  9 Jan 2024 11:20:49 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.com (unknown [10.42.28.67])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 93EA31C060B1;
	Tue,  9 Jan 2024 11:20:46 +0000 (UTC)
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
Subject: [PATCH 3/6] netfs: Fix interaction between write-streaming and cachefiles culling
Date: Tue,  9 Jan 2024 11:20:20 +0000
Message-ID: <20240109112029.1572463-4-dhowells@redhat.com>
In-Reply-To: <20240109112029.1572463-1-dhowells@redhat.com>
References: <20240109112029.1572463-1-dhowells@redhat.com>
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

An issue can occur between write-streaming (storing dirty data in partial
non-uptodate pages) and a cachefiles object being culled to make space.
The problem occurs because the cache object is only marked in use while
there are files open using it.  Once it has been released, it can be culled
and the cookie marked disabled.

At this point, a streaming write is permitted to occur (if the cache is
active, we require pages to be prefetched and cached), but the cache can
become active again before this gets flushed out - and then two effects can
occur:

 (1) The cache may be asked to write out a region that's less than its DIO
     block size (assumed by cachefiles to be PAGE_SIZE) - and this causes
     one of two debugging statements to be emitted.

 (2) netfs_how_to_modify() gets confused because it sees a page that isn't
     allowed to be non-uptodate being uptodate and tries to prefetch it -
     leading to a warning that PG_fscache is set twice.

Fix this by the following means:

 (1) Add a netfs_inode flag to disallow write-streaming to an inode and set
     it if we ever do local caching of that inode.  It remains set for the
     lifetime of that inode - even if the cookie becomes disabled.

 (2) If the no-write-streaming flag is set, then make netfs_how_to_modify()
     always want to prefetch instead.

 (3) If netfs_how_to_modify() decides it wants to prefetch a folio, but
     that folio has write-streamed data in it, then it requires the folio
     be flushed first.

 (4) Export a counter of the number of times we wanted to prefetch a
     non-uptodate page, but found it had write-streamed data in it.

 (5) Export a counter of the number of times we cancelled a write to the
     cache because it didn't DIO align and remove the debug statements.

Reported-by: Marc Dionne <marc.dionne@auristor.com>
Signed-off-by: David Howells <dhowells@redhat.com>
cc: Jeff Layton <jlayton@kernel.org>
cc: linux-cachefs@redhat.com
cc: linux-erofs@lists.ozlabs.org
cc: linux-fsdevel@vger.kernel.org
cc: linux-mm@kvack.org
---
 fs/cachefiles/io.c            | 12 ++++++------
 fs/netfs/buffered_write.c     | 24 ++++++++++++++++++++----
 fs/netfs/fscache_stats.c      |  9 ++++++---
 fs/netfs/internal.h           |  1 +
 fs/netfs/stats.c              |  6 ++++--
 include/linux/fscache-cache.h |  3 +++
 include/linux/netfs.h         |  1 +
 7 files changed, 41 insertions(+), 15 deletions(-)

diff --git a/fs/cachefiles/io.c b/fs/cachefiles/io.c
index 7529b40bc95a..3eec26967437 100644
--- a/fs/cachefiles/io.c
+++ b/fs/cachefiles/io.c
@@ -528,12 +528,12 @@ int __cachefiles_prepare_write(struct cachefiles_object *object,
 
 	/* Round to DIO size */
 	start = round_down(*_start, PAGE_SIZE);
-	if (start != *_start) {
-		kleave(" = -ENOBUFS [down]");
-		return -ENOBUFS;
-	}
-	if (*_len > upper_len) {
-		kleave(" = -ENOBUFS [up]");
+	if (start != *_start || *_len > upper_len) {
+		/* Probably asked to cache a streaming write written into the
+		 * pagecache when the cookie was temporarily out of service to
+		 * culling.
+		 */
+		fscache_count_dio_misfit();
 		return -ENOBUFS;
 	}
 
diff --git a/fs/netfs/buffered_write.c b/fs/netfs/buffered_write.c
index 08f28800232c..6cd8f7422e9a 100644
--- a/fs/netfs/buffered_write.c
+++ b/fs/netfs/buffered_write.c
@@ -80,10 +80,19 @@ static enum netfs_how_to_modify netfs_how_to_modify(struct netfs_inode *ctx,
 		return NETFS_WHOLE_FOLIO_MODIFY;
 
 	if (file->f_mode & FMODE_READ)
-		return NETFS_JUST_PREFETCH;
-
-	if (netfs_is_cache_enabled(ctx))
-		return NETFS_JUST_PREFETCH;
+		goto no_write_streaming;
+	if (test_bit(NETFS_ICTX_NO_WRITE_STREAMING, &ctx->flags))
+		goto no_write_streaming;
+
+	if (netfs_is_cache_enabled(ctx)) {
+		/* We don't want to get a streaming write on a file that loses
+		 * caching service temporarily because the backing store got
+		 * culled.
+		 */
+		if (!test_bit(NETFS_ICTX_NO_WRITE_STREAMING, &ctx->flags))
+			set_bit(NETFS_ICTX_NO_WRITE_STREAMING, &ctx->flags);
+		goto no_write_streaming;
+	}
 
 	if (!finfo)
 		return NETFS_STREAMING_WRITE;
@@ -95,6 +104,13 @@ static enum netfs_how_to_modify netfs_how_to_modify(struct netfs_inode *ctx,
 	if (offset == finfo->dirty_offset + finfo->dirty_len)
 		return NETFS_STREAMING_WRITE_CONT;
 	return NETFS_FLUSH_CONTENT;
+
+no_write_streaming:
+	if (finfo) {
+		netfs_stat(&netfs_n_wh_wstream_conflict);
+		return NETFS_FLUSH_CONTENT;
+	}
+	return NETFS_JUST_PREFETCH;
 }
 
 /*
diff --git a/fs/netfs/fscache_stats.c b/fs/netfs/fscache_stats.c
index aad812ead398..add21abdf713 100644
--- a/fs/netfs/fscache_stats.c
+++ b/fs/netfs/fscache_stats.c
@@ -48,13 +48,15 @@ atomic_t fscache_n_no_create_space;
 EXPORT_SYMBOL(fscache_n_no_create_space);
 atomic_t fscache_n_culled;
 EXPORT_SYMBOL(fscache_n_culled);
+atomic_t fscache_n_dio_misfit;
+EXPORT_SYMBOL(fscache_n_dio_misfit);
 
 /*
  * display the general statistics
  */
 int fscache_stats_show(struct seq_file *m)
 {
-	seq_puts(m, "FS-Cache statistics\n");
+	seq_puts(m, "-- FS-Cache statistics --\n");
 	seq_printf(m, "Cookies: n=%d v=%d vcol=%u voom=%u\n",
 		   atomic_read(&fscache_n_cookies),
 		   atomic_read(&fscache_n_volumes),
@@ -93,8 +95,9 @@ int fscache_stats_show(struct seq_file *m)
 		   atomic_read(&fscache_n_no_create_space),
 		   atomic_read(&fscache_n_culled));
 
-	seq_printf(m, "IO     : rd=%u wr=%u\n",
+	seq_printf(m, "IO     : rd=%u wr=%u mis=%u\n",
 		   atomic_read(&fscache_n_read),
-		   atomic_read(&fscache_n_write));
+		   atomic_read(&fscache_n_write),
+		   atomic_read(&fscache_n_dio_misfit));
 	return 0;
 }
diff --git a/fs/netfs/internal.h b/fs/netfs/internal.h
index 3f9620d0fa63..ec7045d24400 100644
--- a/fs/netfs/internal.h
+++ b/fs/netfs/internal.h
@@ -123,6 +123,7 @@ extern atomic_t netfs_n_rh_write_begin;
 extern atomic_t netfs_n_rh_write_done;
 extern atomic_t netfs_n_rh_write_failed;
 extern atomic_t netfs_n_rh_write_zskip;
+extern atomic_t netfs_n_wh_wstream_conflict;
 extern atomic_t netfs_n_wh_upload;
 extern atomic_t netfs_n_wh_upload_done;
 extern atomic_t netfs_n_wh_upload_failed;
diff --git a/fs/netfs/stats.c b/fs/netfs/stats.c
index 42db36528d92..deeba9f9dcf5 100644
--- a/fs/netfs/stats.c
+++ b/fs/netfs/stats.c
@@ -29,6 +29,7 @@ atomic_t netfs_n_rh_write_begin;
 atomic_t netfs_n_rh_write_done;
 atomic_t netfs_n_rh_write_failed;
 atomic_t netfs_n_rh_write_zskip;
+atomic_t netfs_n_wh_wstream_conflict;
 atomic_t netfs_n_wh_upload;
 atomic_t netfs_n_wh_upload_done;
 atomic_t netfs_n_wh_upload_failed;
@@ -66,9 +67,10 @@ int netfs_stats_show(struct seq_file *m, void *v)
 		   atomic_read(&netfs_n_wh_write),
 		   atomic_read(&netfs_n_wh_write_done),
 		   atomic_read(&netfs_n_wh_write_failed));
-	seq_printf(m, "Netfs  : rr=%u sr=%u\n",
+	seq_printf(m, "Netfs  : rr=%u sr=%u wsc=%u\n",
 		   atomic_read(&netfs_n_rh_rreq),
-		   atomic_read(&netfs_n_rh_sreq));
+		   atomic_read(&netfs_n_rh_sreq),
+		   atomic_read(&netfs_n_wh_wstream_conflict));
 	return fscache_stats_show(m);
 }
 EXPORT_SYMBOL(netfs_stats_show);
diff --git a/include/linux/fscache-cache.h b/include/linux/fscache-cache.h
index a174cedf4d90..bdf7f3eddf0a 100644
--- a/include/linux/fscache-cache.h
+++ b/include/linux/fscache-cache.h
@@ -189,17 +189,20 @@ extern atomic_t fscache_n_write;
 extern atomic_t fscache_n_no_write_space;
 extern atomic_t fscache_n_no_create_space;
 extern atomic_t fscache_n_culled;
+extern atomic_t fscache_n_dio_misfit;
 #define fscache_count_read() atomic_inc(&fscache_n_read)
 #define fscache_count_write() atomic_inc(&fscache_n_write)
 #define fscache_count_no_write_space() atomic_inc(&fscache_n_no_write_space)
 #define fscache_count_no_create_space() atomic_inc(&fscache_n_no_create_space)
 #define fscache_count_culled() atomic_inc(&fscache_n_culled)
+#define fscache_count_dio_misfit() atomic_inc(&fscache_n_dio_misfit)
 #else
 #define fscache_count_read() do {} while(0)
 #define fscache_count_write() do {} while(0)
 #define fscache_count_no_write_space() do {} while(0)
 #define fscache_count_no_create_space() do {} while(0)
 #define fscache_count_culled() do {} while(0)
+#define fscache_count_dio_misfit() do {} while(0)
 #endif
 
 #endif /* _LINUX_FSCACHE_CACHE_H */
diff --git a/include/linux/netfs.h b/include/linux/netfs.h
index d3bac60fcd6f..100cbb261269 100644
--- a/include/linux/netfs.h
+++ b/include/linux/netfs.h
@@ -142,6 +142,7 @@ struct netfs_inode {
 #define NETFS_ICTX_ODIRECT	0		/* The file has DIO in progress */
 #define NETFS_ICTX_UNBUFFERED	1		/* I/O should not use the pagecache */
 #define NETFS_ICTX_WRITETHROUGH	2		/* Write-through caching */
+#define NETFS_ICTX_NO_WRITE_STREAMING	3	/* Don't engage in write-streaming */
 };
 
 /*

-- 
You received this message because you are subscribed to the Google Groups "linux-cachefs@redhat.com" group.
To unsubscribe from this group and stop receiving emails from it, send an email to linux-cachefs+unsubscribe@redhat.com.

