Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id A6E473901FA
	for <lists+linux-cachefs@lfdr.de>; Tue, 25 May 2021 15:17:26 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-137-i7CYMBWMPdOXNB4yaf50Bg-1; Tue, 25 May 2021 09:17:23 -0400
X-MC-Unique: i7CYMBWMPdOXNB4yaf50Bg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BF9421009446;
	Tue, 25 May 2021 13:17:20 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id AA79AE2D0;
	Tue, 25 May 2021 13:17:20 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 93439180102B;
	Tue, 25 May 2021 13:17:20 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 14P4VdCU005658 for <linux-cachefs@listman.util.phx.redhat.com>;
	Tue, 25 May 2021 00:31:40 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id D230A9C063; Tue, 25 May 2021 04:31:39 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id CB6119C06E
	for <linux-cachefs@redhat.com>; Tue, 25 May 2021 04:31:36 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 79F34185A79C
	for <linux-cachefs@redhat.com>; Tue, 25 May 2021 04:31:36 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99]) (Using TLS)
	by relay.mimecast.com with ESMTP id us-mta-339-Biw09_ajOjGXdCqa_jIuig-1;
	Tue, 25 May 2021 00:31:34 -0400
X-MC-Unique: Biw09_ajOjGXdCqa_jIuig-1
Received: by mail.kernel.org (Postfix) with ESMTPSA id 2AFA460232;
	Tue, 25 May 2021 04:21:37 +0000 (UTC)
Date: Mon, 24 May 2021 21:21:36 -0700
From: "Darrick J. Wong" <djwong@kernel.org>
To: Josh Triplett <josh@joshtriplett.org>
Message-ID: <20210525042136.GA202068@locust>
References: <206078.1621264018@warthog.procyon.org.uk>
	<6E4DE257-4220-4B5B-B3D0-B67C7BC69BB5@dilger.ca>
	<YKntRtEUoxTEFBOM@localhost>
MIME-Version: 1.0
In-Reply-To: <YKntRtEUoxTEFBOM@localhost>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-loop: linux-cachefs@redhat.com
X-Mailman-Approved-At: Tue, 25 May 2021 09:17:16 -0400
Cc: Andreas Dilger <adilger@dilger.ca>, xfs <linux-xfs@vger.kernel.org>,
	Theodore Ts'o <tytso@mit.edu>, NeilBrown <neilb@suse.com>,
	Chris Mason <clm@fb.com>, linux-cachefs@redhat.com,
	linux-fsdevel <linux-fsdevel@vger.kernel.org>,
	Ext4 Developers List <linux-ext4@vger.kernel.org>,
	linux-btrfs <linux-btrfs@vger.kernel.org>
Subject: Re: [Linux-cachefs] How capacious and well-indexed are ext4,
 xfs and btrfs directories?
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Sat, May 23, 2021 at 10:51:02PM -0700, Josh Triplett wrote:
> On Thu, May 20, 2021 at 11:13:28PM -0600, Andreas Dilger wrote:
> > On May 17, 2021, at 9:06 AM, David Howells <dhowells@redhat.com> wrote:
> > > With filesystems like ext4, xfs and btrfs, what are the limits on directory
> > > capacity, and how well are they indexed?
> > > 
> > > The reason I ask is that inside of cachefiles, I insert fanout directories
> > > inside index directories to divide up the space for ext2 to cope with the
> > > limits on directory sizes and that it did linear searches (IIRC).
> > > 
> > > For some applications, I need to be able to cache over 1M entries (render
> > > farm) and even a kernel tree has over 100k.
> > > 
> > > What I'd like to do is remove the fanout directories, so that for each logical
> > > "volume"[*] I have a single directory with all the files in it.  But that
> > > means sticking massive amounts of entries into a single directory and hoping
> > > it (a) isn't too slow and (b) doesn't hit the capacity limit.
> > 
> > Ext4 can comfortably handle ~12M entries in a single directory, if the
> > filenames are not too long (e.g. 32 bytes or so).  With the "large_dir"
> > feature (since 4.13, but not enabled by default) a single directory can
> > hold around 4B entries, basically all the inodes of a filesystem.
> 
> ext4 definitely seems to be able to handle it. I've seen bottlenecks in
> other parts of the storage stack, though.
> 
> With a normal NVMe drive, a dm-crypt volume containing ext4, and discard
> enabled (on both ext4 and dm-crypt), I've seen rm -r of a directory with
> a few million entries (each pointing to a ~4-8k file) take the better
> part of an hour, almost all of it system time in iowait. Also makes any
> other concurrent disk writes hang, even a simple "touch x". Turning off
> discard speeds it up by several orders of magnitude.

Synchronous discard is slow, even on NVME.

Background discard (aka fstrim in a cron job) isn't quite as bad, at
least in the sense of amortizing a bunch of clearing over an entire week
of not issuing discards. :P

--D

> 
> (I don't know if this is a known issue or not, so here are the details
> just in case it isn't. Also, if this is already fixed in a newer kernel,
> my apologies for the outdated report.)
> 
> $ uname -a
> Linux s 5.10.0-6-amd64 #1 SMP Debian 5.10.28-1 (2021-04-09) x86_64 GNU/Linux
> 
> Reproducer (doesn't take *as* long but still long enough to demonstrate
> the issue):
> $ mkdir testdir
> $ time python3 -c 'for i in range(1000000): open(f"testdir/{i}", "wb").write(b"test data")'
> $ time rm -r testdir
> 
> dmesg details:
> 
> INFO: task rm:379934 blocked for more than 120 seconds.
>       Not tainted 5.10.0-6-amd64 #1 Debian 5.10.28-1
> "echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
> task:rm              state:D stack:    0 pid:379934 ppid:379461 flags:0x00004000
> Call Trace:
>  __schedule+0x282/0x870
>  schedule+0x46/0xb0
>  wait_transaction_locked+0x8a/0xd0 [jbd2]
>  ? add_wait_queue_exclusive+0x70/0x70
>  add_transaction_credits+0xd6/0x2a0 [jbd2]
>  start_this_handle+0xfb/0x520 [jbd2]
>  ? jbd2__journal_start+0x8d/0x1e0 [jbd2]
>  ? kmem_cache_alloc+0xed/0x1f0
>  jbd2__journal_start+0xf7/0x1e0 [jbd2]
>  __ext4_journal_start_sb+0xf3/0x110 [ext4]
>  ext4_evict_inode+0x24c/0x630 [ext4]
>  evict+0xd1/0x1a0
>  do_unlinkat+0x1db/0x2f0
>  do_syscall_64+0x33/0x80
>  entry_SYSCALL_64_after_hwframe+0x44/0xa9
> RIP: 0033:0x7f088f0c3b87
> RSP: 002b:00007ffc8d3a27a8 EFLAGS: 00000246 ORIG_RAX: 0000000000000107
> RAX: ffffffffffffffda RBX: 000055ffee46de70 RCX: 00007f088f0c3b87
> RDX: 0000000000000000 RSI: 000055ffee46df78 RDI: 0000000000000004
> RBP: 000055ffece9daa0 R08: 0000000000000100 R09: 0000000000000001
> R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000000
> R13: 00007ffc8d3a2980 R14: 00007ffc8d3a2980 R15: 0000000000000002
> INFO: task touch:379982 blocked for more than 120 seconds.
>       Not tainted 5.10.0-6-amd64 #1 Debian 5.10.28-1
> "echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
> task:touch           state:D stack:    0 pid:379982 ppid:379969 flags:0x00000000
> Call Trace:
>  __schedule+0x282/0x870
>  schedule+0x46/0xb0
>  wait_transaction_locked+0x8a/0xd0 [jbd2]
>  ? add_wait_queue_exclusive+0x70/0x70
>  add_transaction_credits+0xd6/0x2a0 [jbd2]
>  ? xas_load+0x5/0x70
>  ? find_get_entry+0xd1/0x170
>  start_this_handle+0xfb/0x520 [jbd2]
>  ? jbd2__journal_start+0x8d/0x1e0 [jbd2]
>  ? kmem_cache_alloc+0xed/0x1f0
>  jbd2__journal_start+0xf7/0x1e0 [jbd2]
>  __ext4_journal_start_sb+0xf3/0x110 [ext4]
>  __ext4_new_inode+0x721/0x1670 [ext4]
>  ext4_create+0x106/0x1b0 [ext4]
>  path_openat+0xde1/0x1080
>  do_filp_open+0x88/0x130
>  ? getname_flags.part.0+0x29/0x1a0
>  ? __check_object_size+0x136/0x150
>  do_sys_openat2+0x97/0x150
>  __x64_sys_openat+0x54/0x90
>  do_syscall_64+0x33/0x80
>  entry_SYSCALL_64_after_hwframe+0x44/0xa9
> RIP: 0033:0x7fb2afb8fbe7
> RSP: 002b:00007ffee3e287b0 EFLAGS: 00000246 ORIG_RAX: 0000000000000101
> RAX: ffffffffffffffda RBX: 00007ffee3e28a68 RCX: 00007fb2afb8fbe7
> RDX: 0000000000000941 RSI: 00007ffee3e2a340 RDI: 00000000ffffff9c
> RBP: 00007ffee3e2a340 R08: 0000000000000000 R09: 0000000000000000
> R10: 00000000000001b6 R11: 0000000000000246 R12: 0000000000000941
> R13: 00007ffee3e2a340 R14: 0000000000000000 R15: 0000000000000000
> 
> 

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

