Return-Path: <linux-cachefs+bncBCHIDX6I2QHBBKUR36WQMGQEKTCWXFQ@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com [209.85.167.200])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DF3A840A70
	for <lists+linux-cachefs@lfdr.de>; Mon, 29 Jan 2024 16:47:56 +0100 (CET)
Received: by mail-oi1-f200.google.com with SMTP id 5614622812f47-3bb9f35fbfcsf2934852b6e.0
        for <lists+linux-cachefs@lfdr.de>; Mon, 29 Jan 2024 07:47:56 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1706543275; cv=pass;
        d=google.com; s=arc-20160816;
        b=BMGeHvr3SxS+K/ydexDSUf2G+jCPdkuL0ZnH9VvMcb6Q6PsUiy8H21VTJjJIf4yqYG
         RE6iPremhE8b1I+X2xOGh7LqHCVx6fyfsK9Cv1xwRr92E6nwfZ7dJLr/1gW++AMNWm1p
         aXxlXDFkBHn5zbzSu8TFv+UQxSw671ficZE1G6bhjykuuDRtW1FWJbGnmudggFo9NXPB
         PyfOzHsmhp2aUckX7JBT768GT7jPiZa9pvV0EO5Mpf31JkNaEMfpONCXEMt1osbDax9A
         84U9ZllYsv+Mtp+YFcfXvoj7LMQgp5cbgDkIwT+zoc44q/sjMjpUFLoqh4LlPNayB9Eq
         G+EA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-archive:list-help:list-post:list-id
         :mailing-list:precedence:mime-version:message-id:date:subject:cc:to
         :from:delivered-to;
        bh=HkYI1oqRHW+T9k21/HSct2iDfuzA5iQiXAdmW4UuYIw=;
        fh=2Q9rZszsc8F1kxrsdW3EL5Go6viRlWqX9Zp15BMfONg=;
        b=k+TVed09idmzzvsX16azOVDCEjfK73kkvI6BxAXv9KBbedYOMCGJp63cYrGNLkrRA+
         dNJ/SaFSyNA8L//XWr4FIeJR/e8vy+shloV+8I9LS76hKz/9FIi0uzQPzNSpb2BhJG54
         u28/gEHTksLTUhYHvRf4MBcUrab7WsHtMViAv8t0P4hD5GXqYUw+MWKdgLBvCrBjIyc0
         15koe2dbbXkwB9Nu7WxuikElP6hQW67Qin20FBzthOIU5omaixErERs9AJOs13Hc9Uwr
         QSo4KZ+CFZDaxU872QDAc5pYGUiw7PTX7qJKA9oOFyHquO0aQvIBDE4IpwvPhMSYI5Sp
         Q7NA==
ARC-Authentication-Results: i=2; mx.google.com;
       gateway.spf=pass (google.com: domain gapps.redhat.com configured 205.139.110.120 as internal address) smtp.mailfrom=dwysocha@redhat.com smtp.remote-ip=205.139.110.120 policy.d=gapps.redhat.com
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706543275; x=1707148075;
        h=list-unsubscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender:mime-version
         :message-id:date:subject:cc:to:from:delivered-to:x-beenthere
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HkYI1oqRHW+T9k21/HSct2iDfuzA5iQiXAdmW4UuYIw=;
        b=sec66oviRSHMzuB6+3VARgRZOfRSpy6OP2VRs0KFvLQ42oKXPlhkDSlNoTmKenQVSX
         F3WIxsyCs++hj5lRYUu3M/kRtxs7rkbQwJTrb39Z2+dOD7H0ILI3I3avH+8pg9Us7euP
         NHtdsls7ZY3cSMv6u19qJ1ud/PWc+u+CRM4JMS93F8/69x7sFb43u6deGj67vLNJocvE
         YaM9gezEj6xId10eqWNR61j7MzhCCuBYbgD8HdQJV5CPaFCdWgdUZ4ychrldGD5C6b+w
         3tMaANUowE9EJhtKETH+4FpJyNYT8j4c3EUtjD408hdCpSzRh0xhxentLl2M+QFymZ17
         L/Tw==
X-Gm-Message-State: AOJu0YzizNYPoAWoBpmDYWjW1U0/nKwX6Mzz1Bq4kd20LAYNPg5+wkSK
	PxXH23mNRG5eGD7XynkH2CzDoA6ikYQwX641cIcj8G8dRa5quT5DTO/fbIMmG58=
X-Google-Smtp-Source: AGHT+IFDkqQak2/I6uQfJFrxbLhAEG36ioAHgsDm02u2itDjkQb/0PujBsqo+gwS2VQKN4uYsA4ECw==
X-Received: by 2002:a05:6808:1903:b0:3be:250c:7a92 with SMTP id bf3-20020a056808190300b003be250c7a92mr4655892oib.17.1706543274957;
        Mon, 29 Jan 2024 07:47:54 -0800 (PST)
X-BeenThere: linux-cachefs@redhat.com
Received: by 2002:ac8:5bc8:0:b0:42a:9900:4ba4 with SMTP id b8-20020ac85bc8000000b0042a99004ba4ls3364236qtb.1.-pod-prod-08-us;
 Mon, 29 Jan 2024 07:47:54 -0800 (PST)
X-Received: by 2002:a05:622a:1a81:b0:42a:2630:1235 with SMTP id s1-20020a05622a1a8100b0042a26301235mr8160040qtc.5.1706543273951;
        Mon, 29 Jan 2024 07:47:53 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1706543273; cv=none;
        d=google.com; s=arc-20160816;
        b=av+6kj1EZMxTfxeeCAZwzJ1XIWK6S8oNZ9+Jrv0SYTfC6zl8pdVmT4NlYLavpiCSgW
         /4iftSjXzDqKIRydAUrOxFh+1ym2WAE74Az+DKO69gS6VEnHJX3AL3v4hrGw5Ch5VgCS
         XuExzAJ/0b3CaEXPTcdNUW+OiK05AwUAj/5bXQo79dCzcpDWWmbueHJSkeJOkGSB+E0Y
         Y92c26ljSXrQlOOMiXsAlfwoDabCMI687IEW28el6ka3M+FB3bXttwdoIjZtg77zOBRm
         BUYTpPkr4IsPNEdNqt/5mCSrRKeroLZZ72NcMdzrDKwredfRMBIxfV//zmdopuvP56K8
         LoTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:delivered-to;
        bh=mtpw32xGy089W9cbEb7EUhBnWe/H+a2oU2I5sBja1o0=;
        fh=2Q9rZszsc8F1kxrsdW3EL5Go6viRlWqX9Zp15BMfONg=;
        b=pdHc9dMq8FGJcJEVjI9ngx58QzgOPD+vxlxp4BH//LRK8PGMDHibC7pFJhrssuxUH+
         M09A6Nc9M66JhSXgY97leLli9VKGQbGlV6cISRX+BC1d/Tp2uI2a798oyxFegWG0FcI4
         +iTJ89Hc4lliL/RKs8lpzemMHMhOtTQb0SPzM0g+P3xdvUrKzRiurU7ln/S5YpoUxzTm
         /w2FewwegRS70m4cqsBvnxAyAmI73MFj1K9ePfczdlamR1zY0r61YCeJFVNu0Iqe3S0y
         uiZY4PBK6QHxK5deCRUNn/MJT0aQdM22QwAtoQFuMbDvBnkOHeXGzHFFfV3uEltY/9WI
         Klwg==
ARC-Authentication-Results: i=1; mx.google.com;
       gateway.spf=pass (google.com: domain gapps.redhat.com configured 205.139.110.120 as internal address) smtp.mailfrom=dwysocha@redhat.com smtp.remote-ip=205.139.110.120 policy.d=gapps.redhat.com
Received: from us-smtp-inbound-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com. [205.139.110.120])
        by mx.google.com with ESMTPS id c9-20020ac87d89000000b0042a88077638si6226114qtd.327.2024.01.29.07.47.53
        for <linux-cachefs@gapps.redhat.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jan 2024 07:47:53 -0800 (PST)
Received-SPF: pass (google.com: domain gapps.redhat.com configured 205.139.110.120 as internal address)
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-522-yyEQyG2mNMOHdXAJ5WWIQw-1; Mon, 29 Jan 2024 10:47:52 -0500
X-MC-Unique: yyEQyG2mNMOHdXAJ5WWIQw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id DE13A87DC04
	for <linux-cachefs@gapps.redhat.com>; Mon, 29 Jan 2024 15:47:51 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
	id DAF6348C; Mon, 29 Jan 2024 15:47:51 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from dwysocha.rdu.csb (unknown [10.22.9.52])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 74570157;
	Mon, 29 Jan 2024 15:47:51 +0000 (UTC)
From: Dave Wysochanski <dwysocha@redhat.com>
To: Anna Schumaker <anna.schumaker@netapp.com>,
	Trond Myklebust <trond.myklebust@hammerspace.com>
Cc: David Howells <dhowells@redhat.com>,
	Jeff Layton <jlayton@kernel.org>,
	linux-nfs@vger.kernel.org,
	linux-cachefs@redhat.com
Subject: [PATCH] NFS: Fix nfs_netfs_issue_read() xarray locking for writeback interrupt
Date: Mon, 29 Jan 2024 10:47:50 -0500
Message-Id: <20240129154750.1245317-1-dwysocha@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"; x-default=true
X-Original-Sender: dwysocha@redhat.com
X-Original-Authentication-Results: mx.google.com;       gateway.spf=pass
 (google.com: domain gapps.redhat.com configured 205.139.110.120 as internal
 address) smtp.mailfrom=dwysocha@redhat.com smtp.remote-ip=205.139.110.120 policy.d=gapps.redhat.com
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
an interrupt, and deadlock can occur.  To fix this, use the
irqsave/irqrestore primitives for the xa_lock.

The problem is easily reproduced with the following test:
 mount -o vers=3,fsc 127.0.0.1:/export /mnt/nfs
 dd if=/dev/zero of=/mnt/nfs/file1.bin bs=4096 count=1
 echo 3 > /proc/sys/vm/drop_caches
 dd if=/mnt/nfs/file1.bin of=/dev/null
 umount /mnt/nfs

On the console with a lockdep-enabled kernel a message similar to the
following will be seen:

 ================================
 WARNING: inconsistent lock state
 6.7.0-lockdbg+ #10 Not tainted
 --------------------------------
 inconsistent {IN-SOFTIRQ-W} -> {SOFTIRQ-ON-W} usage.
 test5/1708 [HC0[0]:SC0[0]:HE1:SE1] takes:
 ffff888127baa598 (&xa->xa_lock#4){+.?.}-{3:3}, at: nfs_netfs_issue_read+0x1b2/0x4b0 [nfs]
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
 hardirqs last  enabled at (176891): [<ffffffffa67a0be4>] _raw_spin_unlock_irqrestore+0x44/0x60
 hardirqs last disabled at (176890): [<ffffffffa67a0899>] _raw_spin_lock_irqsave+0x79/0xa0
 softirqs last  enabled at (176646): [<ffffffffa515d91e>] __irq_exit_rcu+0xfe/0x120
 softirqs last disabled at (176633): [<ffffffffa515d91e>] __irq_exit_rcu+0xfe/0x120

 other info that might help us debug this:
  Possible unsafe locking scenario:

        CPU0
        ----
   lock(&xa->xa_lock#4);
   <Interrupt>
     lock(&xa->xa_lock#4);

  *** DEADLOCK ***

 2 locks held by test5/1708:
  #0: ffff888127baa498 (&sb->s_type->i_mutex_key#22){++++}-{4:4}, at: nfs_start_io_read+0x28/0x90 [nfs]
  #1: ffff888127baa650 (mapping.invalidate_lock#3){.+.+}-{4:4}, at: page_cache_ra_unbounded+0xa4/0x280

 stack backtrace:
 CPU: 6 PID: 1708 Comm: test5 Kdump: loaded Not tainted 6.7.0-lockdbg+ #10
 Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS 1.16.3-1.fc39 04/01/2014
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

Fixes: 000dbe0bec05 ("NFS: Convert buffered read paths to use netfs when fscache is enabled")
Reviewed-by: Jeff Layton <jlayton@redhat.com>
Signed-off-by: Dave Wysochanski <dwysocha@redhat.com>
---
 fs/nfs/fscache.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/fs/nfs/fscache.c b/fs/nfs/fscache.c
index b05717fe0d4e..de7ec89bfe8d 100644
--- a/fs/nfs/fscache.c
+++ b/fs/nfs/fscache.c
@@ -308,6 +308,7 @@ static void nfs_netfs_issue_read(struct netfs_io_subrequest *sreq)
 	struct nfs_open_context *ctx = sreq->rreq->netfs_priv;
 	struct page *page;
 	int err;
+	unsigned long flags;
 	pgoff_t start = (sreq->start + sreq->transferred) >> PAGE_SHIFT;
 	pgoff_t last = ((sreq->start + sreq->len -
 			 sreq->transferred - 1) >> PAGE_SHIFT);
@@ -322,19 +323,19 @@ static void nfs_netfs_issue_read(struct netfs_io_subrequest *sreq)
 
 	pgio.pg_netfs = netfs; /* used in completion */
 
-	xas_lock(&xas);
+	xas_lock_irqsave(&xas, flags);
 	xas_for_each(&xas, page, last) {
 		/* nfs_read_add_folio() may schedule() due to pNFS layout and other RPCs  */
 		xas_pause(&xas);
-		xas_unlock(&xas);
+		xas_unlock_irqrestore(&xas, flags);
 		err = nfs_read_add_folio(&pgio, ctx, page_folio(page));
 		if (err < 0) {
 			netfs->error = err;
 			goto out;
 		}
-		xas_lock(&xas);
+		xas_lock_irqsave(&xas, flags);
 	}
-	xas_unlock(&xas);
+	xas_unlock_irqrestore(&xas, flags);
 out:
 	nfs_pageio_complete_read(&pgio);
 	nfs_netfs_put(netfs);
-- 
2.39.3

-- 
You received this message because you are subscribed to the Google Groups "linux-cachefs@redhat.com" group.
To unsubscribe from this group and stop receiving emails from it, send an email to linux-cachefs+unsubscribe@redhat.com.

