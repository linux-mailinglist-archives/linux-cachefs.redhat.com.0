Return-Path: <linux-cachefs+bncBDLIXLMFVAERBSOJ5KWQMGQEM7QFLJQ@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mail.lfdr.de (Postfix) with ESMTPS id 42240844848
	for <lists+linux-cachefs@lfdr.de>; Wed, 31 Jan 2024 20:51:39 +0100 (CET)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-42a99005837sf1849981cf.1
        for <lists+linux-cachefs@lfdr.de>; Wed, 31 Jan 2024 11:51:39 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1706730698; cv=pass;
        d=google.com; s=arc-20160816;
        b=akPplRnGK2eAIDZGt2F8E5mWx/XFrfq5v92Akck/qm/LGYoKep2gl7FArHi4n43LI1
         skAirREwxPfUVGjje3wCbDAc93EOd3D/36rmZT84dagV1i+OzjmjLvT07pCu+10xGZxk
         p3KAT3Fk6xnp51lTZR2VprseHmimbSZsfM19SG7yIiaDPbLgZkB+XZK/J6pNFNmq6cYD
         MZ8EN+hakEybNI91nKz/EZ/B4gtrGG35Rvrj6ey8gFZ0xAYKTjEdlQPy1CRj1ShNayD+
         Hmu/bKVshc+CHqlqMKtBfQB+0w8Gi3p+x+Kq+gg/q0AUIly7Jkpo3vvY0YnpaRBj7D16
         MREg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-archive:list-help:list-post:list-id
         :mailing-list:precedence:content-id:message-id:date:mime-version
         :subject:cc:to:references:in-reply-to:from:organization:delivered-to;
        bh=1qrsL2zkiB0yMg+QuFIOBARjaUuQNecufeh2ZYvnAtA=;
        fh=36vW7TmwTNAC6KeQbL1Pyyfey/HEGGw2UioTITDcREI=;
        b=rRbWlvVqHb26VcmQHXgA3sOmBUz3PIUe0DfOd1etm6QdOz9//MLApj8Yby4BZRPfwH
         Oici4cDPLbxQxYjia0jBVhozVPSn0cgZ3BXlod9z9AwxinWQx9Lg5rXFiH3QH2y1AFyq
         +48qr11LxC95A5Xx0kBe/Men9rCV0rPBUFZprXDXdyE80zwXOm7i+DbyQrzIEElTziX1
         /s8AP8DsQRcP4MxKwUZBfWdMJxH8RA1inkD4KkKvznD/LDk21gwxfgk1GqE2/cNyLoJd
         YMAeUF/qAJ4dXari3oSTNvoXIeOlT+iaG63OsHbSWMqvNitkFHdb++wd963yzRvlHH+u
         mgbQ==
ARC-Authentication-Results: i=2; mx.google.com;
       gateway.spf=pass (google.com: domain gapps.redhat.com configured 207.211.31.120 as internal address) smtp.mailfrom=dhowells@redhat.com smtp.remote-ip=207.211.31.120 policy.d=gapps.redhat.com
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706730698; x=1707335498;
        h=list-unsubscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender:content-id
         :message-id:date:mime-version:subject:cc:to:references:in-reply-to
         :from:organization:delivered-to:x-beenthere:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=1qrsL2zkiB0yMg+QuFIOBARjaUuQNecufeh2ZYvnAtA=;
        b=F3VT0Y2tWIordvs102FdxX1H+UXaRMHSTOamCpU1hHL++DHerPzzeAlsj1tUzuH0Xm
         SHs2AdWQuXcwlYd7R5GUS+t0An3+7em4avnI1+Qa1H9CnaVk6EmuCJG4e0SG7abWT5fX
         kAtRbvwB2SE1fHBuXN3+0HPkcR9Sj/T2c9hTNFsm+JzVukDbWwaGLem1lHNyoDyqHt3G
         jKNBn3Oze0Q1Qxe6tdLFeSUN4PNZKD2258PfIRAHlyCdHowtrFeMQZaT20jltjLu3S5C
         Q+wTrTu/VL0O80j4GnWMC1PJH2sbtlaMd9GBBpG47D6QlVg+FC0zvNegwb0Dbu/t1lM2
         ut5w==
X-Gm-Message-State: AOJu0Yywkmtf7YMh20fersx1pRXhfGDAx8yiH9C/wjMkuTy1Vt1vdVpI
	TSaMMB6qLkqt/L/DdVh++7cQGF54U56Y86zZxd7JY/UWyhY8MOrA7EnjDdFJwMc=
X-Google-Smtp-Source: AGHT+IHuw+xs29lzVoaW6mvG73kGHAlfFzsmsJt6jt/nf32u/1wpz418LUBClkQiwuvjAq60TL4rug==
X-Received: by 2002:a05:622a:155:b0:42a:97dc:9e81 with SMTP id v21-20020a05622a015500b0042a97dc9e81mr1973422qtw.57.1706730697982;
        Wed, 31 Jan 2024 11:51:37 -0800 (PST)
X-BeenThere: linux-cachefs@redhat.com
Received: by 2002:a05:622a:1aa0:b0:42a:21da:27e1 with SMTP id
 s32-20020a05622a1aa000b0042a21da27e1ls301135qtc.0.-pod-prod-09-us; Wed, 31
 Jan 2024 11:51:37 -0800 (PST)
X-Received: by 2002:a05:620a:811f:b0:784:1f7:3af5 with SMTP id os31-20020a05620a811f00b0078401f73af5mr434892qkn.62.1706730697411;
        Wed, 31 Jan 2024 11:51:37 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1706730697; cv=none;
        d=google.com; s=arc-20160816;
        b=mu4IoPIVcMb1jf3JJvDYhqcCcrCgKeVc7/61T5SU4B9OrXgoC7tjM4E2uMWl186gIY
         wr/Xba27u6c+Td8gwI9ajUhqUNDv3TBjPjl4PTd2Q++U0cB9r74Q5d/lZlsDMMrcOryB
         RKRdRPbqef6gMDHC8jrOQm0aHguPe/+kilvhBEKhy5dZ6K1yxd7udJRegFK1dtKVqyuW
         q1VjPnTh9C54IwC/EhZhdVDNS8K2TT4ZHifn4kAFeQDMzZ8beLRmMp8zbgB9sFx9LQw5
         DVv/IM3Xs8VJqXsRrRx9iiGGYeJI1ksCR8c9usMK8p87IZOLQZR+Ie6yq6FG/mLhe/Y0
         lwrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-id:message-id:date:mime-version:subject:cc:to:references
         :in-reply-to:from:organization:delivered-to;
        bh=3CfQB6iGdylq75aVA2NL5ZI7JIQuhLFeRLqOfVSFVCE=;
        fh=36vW7TmwTNAC6KeQbL1Pyyfey/HEGGw2UioTITDcREI=;
        b=ufieiclDlLUzM/YEPXYA862v44vYWxqnbNX1RoJkZ2fs34jmvdVvczdiIjwV3Z66Kg
         o4V+U5nBRqXm0VrgNzAM8Ce4rCjL9M6OZ+jgVKH+T4C4fT/6nZMCshT4/hywvOHV/9uw
         3q853ITIGPr2+pzMBIS5GX20n65zugkDryYFLPUEbPWPiJvbkggPVo+abrkFuZI0RhAX
         6gimcSG+xy5I0VJIPd9MsalET6PFNjyhM8sS8Lju48D3d78dK0bPn059wH1mPQ2ZELnh
         bIitmNBdsfv9vPJe7DKg0drCgx85IfmYu6akAyyWRNKuX7GRvTp2fzqFH56KmEZK/+kn
         fjDA==;
        darn=gapps.redhat.com
ARC-Authentication-Results: i=1; mx.google.com;
       gateway.spf=pass (google.com: domain gapps.redhat.com configured 207.211.31.120 as internal address) smtp.mailfrom=dhowells@redhat.com smtp.remote-ip=207.211.31.120 policy.d=gapps.redhat.com
X-Forwarded-Encrypted: i=0; AJvYcCWawJp2O36wL73fha+oTsNHpx0THwEn2cHwvABixvdwsWwHQwh3ZWhzglryFRLHuFnTR2b1D+DfxRa58/hXT0IE4YiZpa4WNAsMTpydNgk=
Received: from us-smtp-inbound-delivery-1.mimecast.com (us-smtp-inbound-delivery-1.mimecast.com. [207.211.31.120])
        by mx.google.com with ESMTPS id k23-20020a05620a0b9700b007815fc2a677si12818293qkh.699.2024.01.31.11.51.37
        for <linux-cachefs@gapps.redhat.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 Jan 2024 11:51:37 -0800 (PST)
Received-SPF: pass (google.com: domain gapps.redhat.com configured 207.211.31.120 as internal address)
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-671-gGXHc0HgO46eiOKwvhhSMg-1; Wed,
 31 Jan 2024 14:51:35 -0500
X-MC-Unique: gGXHc0HgO46eiOKwvhhSMg-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1ED1B38130B8
	for <linux-cachefs@gapps.redhat.com>; Wed, 31 Jan 2024 19:51:35 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
	id 1B56F492BE4; Wed, 31 Jan 2024 19:51:35 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.uk (unknown [10.42.28.245])
	by smtp.corp.redhat.com (Postfix) with ESMTP id EFCFD492BE2;
	Wed, 31 Jan 2024 19:51:33 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
	Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
	Kingdom.
	Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
In-Reply-To: <20240131161006.1475094-1-dwysocha@redhat.com>
References: <20240131161006.1475094-1-dwysocha@redhat.com>
To: Dave Wysochanski <dwysocha@redhat.com>
Cc: dhowells@redhat.com, Anna Schumaker <anna.schumaker@netapp.com>,
    Trond Myklebust <trond.myklebust@hammerspace.com>,
    Jeff Layton <jlayton@kernel.org>, linux-nfs@vger.kernel.org,
    linux-cachefs@redhat.com
Subject: Re: [PATCH v2] NFS: Fix nfs_netfs_issue_read() xarray locking for writeback interrupt
MIME-Version: 1.0
Date: Wed, 31 Jan 2024 19:51:33 +0000
Message-ID: <2259953.1706730693@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.10
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-ID: <2259952.1706730693.1@warthog.procyon.org.uk>
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

Dave Wysochanski <dwysocha@redhat.com> wrote:

> The loop inside nfs_netfs_issue_read() currently does not disable
> interrupts while iterating through pages in the xarray to submit
> for NFS read.  This is not safe though since after taking xa_lock,
> another page in the mapping could be processed for writeback inside
> an interrupt, and deadlock can occur.  The fix is simple and clean
> if we use xa_for_each_range(), which handles the iteration with RCU
> while reducing code complexity.
> 
> The problem is easily reproduced with the following test:
>  mount -o vers=3,fsc 127.0.0.1:/export /mnt/nfs
>  dd if=/dev/zero of=/mnt/nfs/file1.bin bs=4096 count=1
>  echo 3 > /proc/sys/vm/drop_caches
>  dd if=/mnt/nfs/file1.bin of=/dev/null
>  umount /mnt/nfs
> 
> On the console with a lockdep-enabled kernel a message similar to
> the following will be seen:
> 
>  ================================
>  WARNING: inconsistent lock state
>  6.7.0-lockdbg+ #10 Not tainted
>  --------------------------------
>  inconsistent {IN-SOFTIRQ-W} -> {SOFTIRQ-ON-W} usage.
>  test5/1708 [HC0[0]:SC0[0]:HE1:SE1] takes:
>  ffff888127baa598 (&xa->xa_lock#4){+.?.}-{3:3}, at:
> nfs_netfs_issue_read+0x1b2/0x4b0 [nfs]
>  {IN-SOFTIRQ-W} state was registered at:
>    lock_acquire+0x144/0x380
>    _raw_spin_lock_irqsave+0x4e/0xa0
>    __folio_end_writeback+0x17e/0x5c0
>    folio_end_writeback+0x93/0x1b0
>    iomap_finish_ioend+0xeb/0x6a0
>    blk_update_request+0x204/0x7f0
>    blk_mq_end_request+0x30/0x1c0
>    blk_complete_reqs+0x7e/0xa0
>    __do_softirq+0x113/0x544
>    __irq_exit_rcu+0xfe/0x120
>    irq_exit_rcu+0xe/0x20
>    sysvec_call_function_single+0x6f/0x90
>    asm_sysvec_call_function_single+0x1a/0x20
>    pv_native_safe_halt+0xf/0x20
>    default_idle+0x9/0x20
>    default_idle_call+0x67/0xa0
>    do_idle+0x2b5/0x300
>    cpu_startup_entry+0x34/0x40
>    start_secondary+0x19d/0x1c0
>    secondary_startup_64_no_verify+0x18f/0x19b
>  irq event stamp: 176891
>  hardirqs last  enabled at (176891): [<ffffffffa67a0be4>]
> _raw_spin_unlock_irqrestore+0x44/0x60
>  hardirqs last disabled at (176890): [<ffffffffa67a0899>]
> _raw_spin_lock_irqsave+0x79/0xa0
>  softirqs last  enabled at (176646): [<ffffffffa515d91e>]
> __irq_exit_rcu+0xfe/0x120
>  softirqs last disabled at (176633): [<ffffffffa515d91e>]
> __irq_exit_rcu+0xfe/0x120
> 
>  other info that might help us debug this:
>   Possible unsafe locking scenario:
> 
>         CPU0
>         ----
>    lock(&xa->xa_lock#4);
>    <Interrupt>
>      lock(&xa->xa_lock#4);
> 
>   *** DEADLOCK ***
> 
>  2 locks held by test5/1708:
>   #0: ffff888127baa498 (&sb->s_type->i_mutex_key#22){++++}-{4:4}, at:
>       nfs_start_io_read+0x28/0x90 [nfs]
>   #1: ffff888127baa650 (mapping.invalidate_lock#3){.+.+}-{4:4}, at:
>       page_cache_ra_unbounded+0xa4/0x280
> 
>  stack backtrace:
>  CPU: 6 PID: 1708 Comm: test5 Kdump: loaded Not tainted 6.7.0-lockdbg+
>  Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS 1.16.3-1.fc39
> 04/01/2014
>  Call Trace:
>   dump_stack_lvl+0x5b/0x90
>   mark_lock+0xb3f/0xd20
>   __lock_acquire+0x77b/0x3360
>   _raw_spin_lock+0x34/0x80
>   nfs_netfs_issue_read+0x1b2/0x4b0 [nfs]
>   netfs_begin_read+0x77f/0x980 [netfs]
>   nfs_netfs_readahead+0x45/0x60 [nfs]
>   nfs_readahead+0x323/0x5a0 [nfs]
>   read_pages+0xf3/0x5c0
>   page_cache_ra_unbounded+0x1c8/0x280
>   filemap_get_pages+0x38c/0xae0
>   filemap_read+0x206/0x5e0
>   nfs_file_read+0xb7/0x140 [nfs]
>   vfs_read+0x2a9/0x460
>   ksys_read+0xb7/0x140
> 
> Fixes: 000dbe0bec05 ("NFS: Convert buffered read paths to use netfs when
> fscache is enabled")
> Suggested-by: Jeff Layton <jlayton@redhat.com>
> Signed-off-by: Dave Wysochanski <dwysocha@redhat.com>

Reviewed-by: David Howells <dhowells@redhat.com>

-- 
You received this message because you are subscribed to the Google Groups "linux-cachefs@redhat.com" group.
To unsubscribe from this group and stop receiving emails from it, send an email to linux-cachefs+unsubscribe@redhat.com.

