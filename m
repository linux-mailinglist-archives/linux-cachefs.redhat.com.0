Return-Path: <linux-cachefs+bncBCHIDX6I2QHBBYXB5GWQMGQEHWDBE7Q@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mail.lfdr.de (Postfix) with ESMTPS id DC3018443C0
	for <lists+linux-cachefs@lfdr.de>; Wed, 31 Jan 2024 17:10:12 +0100 (CET)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-68086d6c953sf108579386d6.2
        for <lists+linux-cachefs@lfdr.de>; Wed, 31 Jan 2024 08:10:12 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1706717411; cv=pass;
        d=google.com; s=arc-20160816;
        b=mvhPLUMXzYbyp3aRpKJ8al9ZTGi2TVSsPwtWKCBjJeS9/kYqhO4knJPaIDoEUeRwU/
         pW+QF1oR8Ac3IYorp2JQucr15Q8Mmtz8nqEshE5Cet+kYhBvPafh9V126zFJxbU1KAiN
         m+CsvGhLq9/wGryllQYHMP5gjaKtDHYSMHFBPLuOVyZk1oyudmOy+rqcHM1O6qztUSKM
         G8w7mM93kuI4Z/bbDgT6bYGoB/Y7VNZqs5qnUYYgOgUlSvFCQhfXHhZSVyE5jRr4nhMN
         Tb9colT5L5n3TzhazOmu+E728QDgtoWHD3E/aPTeThjZeElRuzsHp4gAwjf57o2DU0w2
         H6rQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-archive:list-help:list-post:list-id
         :mailing-list:precedence:mime-version:message-id:date:subject:cc:to
         :from:delivered-to;
        bh=ixhsyfKHfM8cal4Q8DxkNg07cFrZ9cixh+pl+gJFxQY=;
        fh=2Q9rZszsc8F1kxrsdW3EL5Go6viRlWqX9Zp15BMfONg=;
        b=X3AM9XEBTVg/0AaLKYOQdcHpWiQoXGweX2zJVwhwnoXZHZzBFH/MyVyY3tevkW4EJ9
         GcJBtv1WeUjaDewjUqbdrH4F90pCXpJ/gx0Ib1/z6NuQFpFN5y9LViSPkQ0j6Dzat3q0
         gfQtSWYwN3b80Oxy5JhzE1CQVvnmkoBe/8BK5/xgLudArQ9gJyjQ/BH2UUsDk03rjmef
         e/XVZ92eGAJI58K/yjLMzBqyajY0jz6QshilwS7WHDm6iMu8T4ppTpCe05hvZ2Rqov+a
         woRyFmwaQLXF5GKDk/OakOlEqwEx8LDzfo0VLbfIdm6m5lhHuSSXnwLX0LyslRYwAOle
         yHtw==
ARC-Authentication-Results: i=2; mx.google.com;
       gateway.spf=pass (google.com: domain gapps.redhat.com configured 207.211.31.120 as internal address) smtp.mailfrom=dwysocha@redhat.com smtp.remote-ip=207.211.31.120 policy.d=gapps.redhat.com
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706717411; x=1707322211;
        h=list-unsubscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender:mime-version
         :message-id:date:subject:cc:to:from:delivered-to:x-beenthere
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ixhsyfKHfM8cal4Q8DxkNg07cFrZ9cixh+pl+gJFxQY=;
        b=A+q1M8el1f+UNckKlauCpAE7HuSXMYcd6za6HuPF4+aLGqSUgEQWYjiZaQL/K9vauJ
         NfcU7Yg33elGWl6WumOJbeq2JssKbUNAvLf9BJNoelVzbP8FCx73jMU9LE9KA/oeIVhx
         lOv5lqjQrqsdwUyCtrIzwp1ivbh767amwmq9IAQ9rfTYjPDmqJvpZj2KLzGWkhNV5usa
         RCkfc5s2l6JVYjfkoVcb05wzCTps1ye5IlW0cn9LcRVnk/nJOCN/2WMnPC/qzCNvBoNh
         mHrYLszjHH5pxYJHDMoMtLGhAZ9hE9p9QQoQSlflz7/GpFWdK6fDsyiQCj2S6bHCWORX
         WXDA==
X-Gm-Message-State: AOJu0Yw5B7aq89waQzs2F4+GmAPZpwLRkQb8VVx3JP7CQ2B7Iz+TezSK
	ZRWUsjL9jLhgMtniCoWbjbJdOMiEuGBcn5YXU00lFHmz2w2MweLYzIvkfZYcQQU=
X-Google-Smtp-Source: AGHT+IFAwnRYM/KLn/YqYIkPQGWSPkSsWmFoTqXzmFRe+bU3rJOEza83vd/nDiC0gGS8rd7aA5KmeQ==
X-Received: by 2002:a05:6214:d48:b0:68c:5d01:1583 with SMTP id 8-20020a0562140d4800b0068c5d011583mr2238100qvr.48.1706717411084;
        Wed, 31 Jan 2024 08:10:11 -0800 (PST)
X-BeenThere: linux-cachefs@redhat.com
Received: by 2002:a0c:ab84:0:b0:681:70c6:da2d with SMTP id j4-20020a0cab84000000b0068170c6da2dls2046585qvb.0.-pod-prod-08-us;
 Wed, 31 Jan 2024 08:10:10 -0800 (PST)
X-Received: by 2002:a67:f656:0:b0:46c:9bfa:994a with SMTP id u22-20020a67f656000000b0046c9bfa994amr1690842vso.14.1706717410051;
        Wed, 31 Jan 2024 08:10:10 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1706717410; cv=none;
        d=google.com; s=arc-20160816;
        b=LO7raXNohrrwXZlf0xZG0RBy0Vkh4rysUFl3Tj5zEIMtcf/NzguTmYaMmgkibtceSu
         qjwTJpAZ5tChMFoJ+6VXyyQmX/B1GumdQNA7Vh3AZDuyUI0lIaABPjqJxLkI4NxeiMNd
         A4N228g6FGPKYjut7PyYfdanMivTmOaUeCLLlnnK149Qv4NBGrQpnVkUL/nxWNDrPk22
         6DRHVjwSIIjA3pXxhc26rF3IggyWPFH7JO4zgcPAG8PpGUYF6yP5nMheWVwUePdcCQPs
         WVz+GysCNdQUzHCao0a6WzbYaS1DWWp1zVlD617SODkC8Rz2zdMo3j5Mbv9gPOQSg2mL
         OkkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:delivered-to;
        bh=Lt3sHrhpNk4V3mKbYLYm+tjlUNv9hVfDfiEkd/fQy0w=;
        fh=2Q9rZszsc8F1kxrsdW3EL5Go6viRlWqX9Zp15BMfONg=;
        b=U/zigxW773ATw7FJpeDBEoq7oWRaQnUA8rk58458r8yfEbX+AF0E6LZxSnedoqgwn+
         6s4KVgi3yMuworvWc35ndEJ8GM7DFFdR0LS+HpVGATJei+p8YqRs/vUxfox/NpXgWWhk
         4pwfzNa6YPW7N+F8JVmdo45eE0dWdBj+g8pWmnjsFGIDcS2BkK5W6koNjRZ1PtLX/w9H
         IMNyDnsqvZ8ANSjsueb+lJbUQfcMEvjI1FsFN3dIcbe0lyBNAuRMrYBOzCUoxGuB3Yli
         XLeRvlRVL9t1VnUKaLAwI7JYuxIQfnPtv9ko+UxlfFVMjH4iturSDOeN40torOXbd0Ql
         sf9A==
ARC-Authentication-Results: i=1; mx.google.com;
       gateway.spf=pass (google.com: domain gapps.redhat.com configured 207.211.31.120 as internal address) smtp.mailfrom=dwysocha@redhat.com smtp.remote-ip=207.211.31.120 policy.d=gapps.redhat.com
Received: from us-smtp-inbound-delivery-1.mimecast.com (us-smtp-inbound-delivery-1.mimecast.com. [207.211.31.120])
        by mx.google.com with ESMTPS id hv27-20020a67e69b000000b0046b2d612eaesi1615440vsb.666.2024.01.31.08.10.09
        for <linux-cachefs@gapps.redhat.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 Jan 2024 08:10:10 -0800 (PST)
Received-SPF: pass (google.com: domain gapps.redhat.com configured 207.211.31.120 as internal address)
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-673-OTcvcrIRPq-IBx-Jgexbnw-1; Wed,
 31 Jan 2024 11:10:08 -0500
X-MC-Unique: OTcvcrIRPq-IBx-Jgexbnw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3C0D41C07F39
	for <linux-cachefs@gapps.redhat.com>; Wed, 31 Jan 2024 16:10:08 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
	id 38A09134; Wed, 31 Jan 2024 16:10:08 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from dwysocha.rdu.csb (unknown [10.22.9.52])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id BD6A63C2E;
	Wed, 31 Jan 2024 16:10:07 +0000 (UTC)
From: Dave Wysochanski <dwysocha@redhat.com>
To: Anna Schumaker <anna.schumaker@netapp.com>,
	Trond Myklebust <trond.myklebust@hammerspace.com>
Cc: David Howells <dhowells@redhat.com>,
	Jeff Layton <jlayton@kernel.org>,
	linux-nfs@vger.kernel.org,
	linux-cachefs@redhat.com
Subject: [PATCH v2] NFS: Fix nfs_netfs_issue_read() xarray locking for writeback interrupt
Date: Wed, 31 Jan 2024 11:10:06 -0500
Message-Id: <20240131161006.1475094-1-dwysocha@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"; x-default=true
X-Original-Sender: dwysocha@redhat.com
X-Original-Authentication-Results: mx.google.com;       gateway.spf=pass
 (google.com: domain gapps.redhat.com configured 207.211.31.120 as internal
 address) smtp.mailfrom=dwysocha@redhat.com smtp.remote-ip=207.211.31.120 policy.d=gapps.redhat.com
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

The loop inside nfs_netfs_issue_read() currently does not disable
interrupts while iterating through pages in the xarray to submit
for NFS read.  This is not safe though since after taking xa_lock,
another page in the mapping could be processed for writeback inside
an interrupt, and deadlock can occur.  The fix is simple and clean
if we use xa_for_each_range(), which handles the iteration with RCU
while reducing code complexity.

The problem is easily reproduced with the following test:
 mount -o vers=3,fsc 127.0.0.1:/export /mnt/nfs
 dd if=/dev/zero of=/mnt/nfs/file1.bin bs=4096 count=1
 echo 3 > /proc/sys/vm/drop_caches
 dd if=/mnt/nfs/file1.bin of=/dev/null
 umount /mnt/nfs

On the console with a lockdep-enabled kernel a message similar to
the following will be seen:

 ================================
 WARNING: inconsistent lock state
 6.7.0-lockdbg+ #10 Not tainted
 --------------------------------
 inconsistent {IN-SOFTIRQ-W} -> {SOFTIRQ-ON-W} usage.
 test5/1708 [HC0[0]:SC0[0]:HE1:SE1] takes:
 ffff888127baa598 (&xa->xa_lock#4){+.?.}-{3:3}, at:
nfs_netfs_issue_read+0x1b2/0x4b0 [nfs]
 {IN-SOFTIRQ-W} state was registered at:
   lock_acquire+0x144/0x380
   _raw_spin_lock_irqsave+0x4e/0xa0
   __folio_end_writeback+0x17e/0x5c0
   folio_end_writeback+0x93/0x1b0
   iomap_finish_ioend+0xeb/0x6a0
   blk_update_request+0x204/0x7f0
   blk_mq_end_request+0x30/0x1c0
   blk_complete_reqs+0x7e/0xa0
   __do_softirq+0x113/0x544
   __irq_exit_rcu+0xfe/0x120
   irq_exit_rcu+0xe/0x20
   sysvec_call_function_single+0x6f/0x90
   asm_sysvec_call_function_single+0x1a/0x20
   pv_native_safe_halt+0xf/0x20
   default_idle+0x9/0x20
   default_idle_call+0x67/0xa0
   do_idle+0x2b5/0x300
   cpu_startup_entry+0x34/0x40
   start_secondary+0x19d/0x1c0
   secondary_startup_64_no_verify+0x18f/0x19b
 irq event stamp: 176891
 hardirqs last  enabled at (176891): [<ffffffffa67a0be4>]
_raw_spin_unlock_irqrestore+0x44/0x60
 hardirqs last disabled at (176890): [<ffffffffa67a0899>]
_raw_spin_lock_irqsave+0x79/0xa0
 softirqs last  enabled at (176646): [<ffffffffa515d91e>]
__irq_exit_rcu+0xfe/0x120
 softirqs last disabled at (176633): [<ffffffffa515d91e>]
__irq_exit_rcu+0xfe/0x120

 other info that might help us debug this:
  Possible unsafe locking scenario:

        CPU0
        ----
   lock(&xa->xa_lock#4);
   <Interrupt>
     lock(&xa->xa_lock#4);

  *** DEADLOCK ***

 2 locks held by test5/1708:
  #0: ffff888127baa498 (&sb->s_type->i_mutex_key#22){++++}-{4:4}, at:
      nfs_start_io_read+0x28/0x90 [nfs]
  #1: ffff888127baa650 (mapping.invalidate_lock#3){.+.+}-{4:4}, at:
      page_cache_ra_unbounded+0xa4/0x280

 stack backtrace:
 CPU: 6 PID: 1708 Comm: test5 Kdump: loaded Not tainted 6.7.0-lockdbg+
 Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS 1.16.3-1.fc39
04/01/2014
 Call Trace:
  dump_stack_lvl+0x5b/0x90
  mark_lock+0xb3f/0xd20
  __lock_acquire+0x77b/0x3360
  _raw_spin_lock+0x34/0x80
  nfs_netfs_issue_read+0x1b2/0x4b0 [nfs]
  netfs_begin_read+0x77f/0x980 [netfs]
  nfs_netfs_readahead+0x45/0x60 [nfs]
  nfs_readahead+0x323/0x5a0 [nfs]
  read_pages+0xf3/0x5c0
  page_cache_ra_unbounded+0x1c8/0x280
  filemap_get_pages+0x38c/0xae0
  filemap_read+0x206/0x5e0
  nfs_file_read+0xb7/0x140 [nfs]
  vfs_read+0x2a9/0x460
  ksys_read+0xb7/0x140

Fixes: 000dbe0bec05 ("NFS: Convert buffered read paths to use netfs when
fscache is enabled")
Suggested-by: Jeff Layton <jlayton@redhat.com>
Signed-off-by: Dave Wysochanski <dwysocha@redhat.com>
---
 fs/nfs/fscache.c | 9 ++-------
 1 file changed, 2 insertions(+), 7 deletions(-)

diff --git a/fs/nfs/fscache.c b/fs/nfs/fscache.c
index b05717fe0d4e..60a3c28784e0 100644
--- a/fs/nfs/fscache.c
+++ b/fs/nfs/fscache.c
@@ -307,11 +307,11 @@ static void nfs_netfs_issue_read(struct netfs_io_subrequest *sreq)
 	struct inode *inode = sreq->rreq->inode;
 	struct nfs_open_context *ctx = sreq->rreq->netfs_priv;
 	struct page *page;
+	unsigned long idx;
 	int err;
 	pgoff_t start = (sreq->start + sreq->transferred) >> PAGE_SHIFT;
 	pgoff_t last = ((sreq->start + sreq->len -
 			 sreq->transferred - 1) >> PAGE_SHIFT);
-	XA_STATE(xas, &sreq->rreq->mapping->i_pages, start);
 
 	nfs_pageio_init_read(&pgio, inode, false,
 			     &nfs_async_read_completion_ops);
@@ -322,19 +322,14 @@ static void nfs_netfs_issue_read(struct netfs_io_subrequest *sreq)
 
 	pgio.pg_netfs = netfs; /* used in completion */
 
-	xas_lock(&xas);
-	xas_for_each(&xas, page, last) {
+	xa_for_each_range(&sreq->rreq->mapping->i_pages, idx, page, start, last) {
 		/* nfs_read_add_folio() may schedule() due to pNFS layout and other RPCs  */
-		xas_pause(&xas);
-		xas_unlock(&xas);
 		err = nfs_read_add_folio(&pgio, ctx, page_folio(page));
 		if (err < 0) {
 			netfs->error = err;
 			goto out;
 		}
-		xas_lock(&xas);
 	}
-	xas_unlock(&xas);
 out:
 	nfs_pageio_complete_read(&pgio);
 	nfs_netfs_put(netfs);
-- 
2.39.3

-- 
You received this message because you are subscribed to the Google Groups "linux-cachefs@redhat.com" group.
To unsubscribe from this group and stop receiving emails from it, send an email to linux-cachefs+unsubscribe@redhat.com.

