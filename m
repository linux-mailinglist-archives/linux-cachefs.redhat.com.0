Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 41F13433713
	for <lists+linux-cachefs@lfdr.de>; Tue, 19 Oct 2021 15:30:23 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-248-s2vLkBliPuOSsCHddpALVw-1; Tue, 19 Oct 2021 09:30:19 -0400
X-MC-Unique: s2vLkBliPuOSsCHddpALVw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B673E8042D4;
	Tue, 19 Oct 2021 13:30:14 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A8B7979447;
	Tue, 19 Oct 2021 13:30:12 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 076F31801241;
	Tue, 19 Oct 2021 13:30:09 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 19JDU2Qr023536 for <linux-cachefs@listman.util.phx.redhat.com>;
	Tue, 19 Oct 2021 09:30:02 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 0C9A2EAFA3; Tue, 19 Oct 2021 13:30:02 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 061B7E778A
	for <linux-cachefs@redhat.com>; Tue, 19 Oct 2021 13:29:59 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1C69B185A7A4
	for <linux-cachefs@redhat.com>; Tue, 19 Oct 2021 13:29:59 +0000 (UTC)
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com
	[209.85.208.43]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-242-BuR2zzejMeKediJYUAuO9Q-1; Tue, 19 Oct 2021 09:29:57 -0400
X-MC-Unique: BuR2zzejMeKediJYUAuO9Q-1
Received: by mail-ed1-f43.google.com with SMTP id d3so13158733edp.3;
	Tue, 19 Oct 2021 06:29:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20210112;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=l2fMMxDDiXx3vgfR9XbtY8zVEKvNNXiKJ69kmRp4vQM=;
	b=pEZbBR/yqIj3I1gb7AvdqBveOj45Oej32nnpL34Z3byd/hWHbHLfcvZA6qgA0r3GwT
	T+UewLvv8+J80t4AhwqgC8tm3de9Y7lKDYiT13FIZM8CzwgJM66EeV9RzuFmd+XbVo+B
	8c7kIabzn9H6ofXAc0utVXq2K4UmP0ireVeBdspaDpF59Ew1k74wraiK5+OkYWHG79GW
	YdMZE0s0r7nEndoLM/xg+5oIhlrhzE1N1yPEuqhiBzVlJelbhHACSIIMig+mJqCM6xmw
	pBJLD7ObaqKyGyRQ6xS3bIyV+lIGypJxzB0QCZxM84azUf50MqLgXgLjeIRazIfLdwDy
	WW8A==
X-Gm-Message-State: AOAM532wukUx50Kobzu/kyj5IZIoEkDOLtbY9U6QM8raoFtmevCB8m4O
	AvVKtQM1U5ONO/FoCatnFAKX+Fx8GkprMVmv
X-Google-Smtp-Source: ABdhPJxWahGJ8G8VBCRpck8lubOrV68duQhqGE2fGaW+cOMH7JNqZ23pleYziort4M6b83EnrGSLMw==
X-Received: by 2002:a05:6402:270e:: with SMTP id
	y14mr53930799edd.190.1634650176605; 
	Tue, 19 Oct 2021 06:29:36 -0700 (PDT)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com.
	[209.85.128.46]) by smtp.gmail.com with ESMTPSA id
	kd8sm10480762ejc.69.2021.10.19.06.29.36
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Tue, 19 Oct 2021 06:29:36 -0700 (PDT)
Received: by mail-wm1-f46.google.com with SMTP id v127so11898606wme.5;
	Tue, 19 Oct 2021 06:29:36 -0700 (PDT)
X-Received: by 2002:a1c:a443:: with SMTP id n64mr6116840wme.32.1634650175559; 
	Tue, 19 Oct 2021 06:29:35 -0700 (PDT)
MIME-Version: 1.0
References: <163456861570.2614702.14754548462706508617.stgit@warthog.procyon.org.uk>
In-Reply-To: <163456861570.2614702.14754548462706508617.stgit@warthog.procyon.org.uk>
From: Marc Dionne <marc.dionne@auristor.com>
Date: Tue, 19 Oct 2021 10:29:24 -0300
X-Gmail-Original-Message-ID: <CAB9dFdumxi0U_339S3PfC4TL83Srqn+qGz2AAbJ995NiLhbxnw@mail.gmail.com>
Message-ID: <CAB9dFdumxi0U_339S3PfC4TL83Srqn+qGz2AAbJ995NiLhbxnw@mail.gmail.com>
To: David Howells <dhowells@redhat.com>
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
Cc: Latchesar Ionkov <lucho@ionkov.net>,
	Dominique Martinet <asmadeus@codewreck.org>, linux-mm@kvack.org,
	linux-afs@lists.infradead.org, Shyam Prasad N <nspmangalore@gmail.com>,
	linux-cifs@vger.kernel.org, Matthew Wilcox <willy@infradead.org>,
	linux-cachefs@redhat.com, Trond Myklebust <trondmy@hammerspace.com>,
	v9fs-developer@lists.sourceforge.net, Ilya Dryomov <idryomov@gmail.com>,
	Kent Overstreet <kent.overstreet@gmail.com>,
	Alexander Viro <viro@zeniv.linux.org.uk>, ceph-devel@vger.kernel.org,
	Trond Myklebust <trond.myklebust@hammerspace.com>,
	linux-nfs@vger.kernel.org, Jeff Layton <jlayton@kernel.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Steve French <sfrench@samba.org>, linux-fsdevel@vger.kernel.org,
	Omar Sandoval <osandov@osandov.com>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Anna Schumaker <anna.schumaker@netapp.com>
Subject: Re: [Linux-cachefs] [PATCH 00/67] fscache: Rewrite index API and
 management system
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, Oct 18, 2021 at 11:50 AM David Howells <dhowells@redhat.com> wrote:
>
>
> Here's a set of patches that rewrites and simplifies the fscache index API
> to remove the complex operation scheduling and object state machine in
> favour of something much smaller and simpler.  It is built on top of the
> set of patches that removes the old API[1].

Testing this series in our afs test framework, saw the oops pasted below.

cachefiles_begin_operation+0x2d maps to cachefiles/io.c:565, where
object is probably NULL (object->file is at offset 0x28).

Marc
===
BUG: kernel NULL pointer dereference, address: 0000000000000028
#PF: supervisor read access in kernel mode
#PF: error_code(0x0000) - not-present page
PGD 0 P4D 0
Oops: 0000 [#1] SMP NOPTI
CPU: 5 PID: 16607 Comm: ar Tainted: G            E
5.15.0-rc5.kafs_testing+ #37
Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS
1.14.0-2.fc34 04/01/2014
RIP: 0010:cachefiles_begin_operation+0x2d/0x80 [cachefiles]
Code: 00 00 55 53 48 83 ec 08 48 8b 47 08 48 83 7f 10 00 48 8b 68 20
74 0c b8 01 00 00 00 48 83 c4 08 5b 5d c3 48 c7 07 a0 12 1b a0 <48> 8b
45 28 48 89 fb 48 85 c0 74 20 48 8d 7d 04 89 74 24 04 e8 3a
RSP: 0018:ffffc90000d33b48 EFLAGS: 00010246
RAX: ffff888014991420 RBX: ffff888100ae9cf0 RCX: 0000000000000000
RDX: 0000000000000001 RSI: 0000000000000000 RDI: ffff888100ae9cf0
RBP: 0000000000000000 R08: 00000000000006b8 R09: ffff88810e98e000
R10: 0000000000000000 R11: 0000000000000000 R12: ffff888014991434
R13: 0000000000000002 R14: ffff888014991420 R15: 0000000000000002
FS:  00007f72d0486b80(0000) GS:ffff888139940000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 0000000000000028 CR3: 000000007bac8004 CR4: 0000000000770ee0
PKRU: 55555554
Call Trace:
 fscache_begin_operation.part.0+0x1e3/0x210 [fscache]
 netfs_write_begin+0x3fb/0x800 [netfs]
 ? __fscache_use_cookie+0x120/0x200 [fscache]
 afs_write_begin+0x58/0x2c0 [kafs]
 ? __vfs_getxattr+0x2a/0x70
 generic_perform_write+0xb1/0x1b0
 ? file_update_time+0xcf/0x120
 __generic_file_write_iter+0x14c/0x1d0
 generic_file_write_iter+0x5d/0xb0
 afs_file_write+0x73/0xa0 [kafs]
 new_sync_write+0x105/0x180
 vfs_write+0x1cb/0x260
 ksys_write+0x4f/0xc0
 do_syscall_64+0x35/0x80
 entry_SYSCALL_64_after_hwframe+0x44/0xae
RIP: 0033:0x7f72d059a7a7
Code: 0d 00 f7 d8 64 89 02 48 c7 c0 ff ff ff ff eb b7 0f 1f 00 f3 0f
1e fa 64 8b 04 25 18 00 00 00 85 c0 75 10 b8 01 00 00 00 0f 05 <48> 3d
00 f0 ff ff 77 51 c3 48 83 ec 28 48 89 54 24 18 48 89 74 24
RSP: 002b:00007fffc31942b8 EFLAGS: 00000246 ORIG_RAX: 0000000000000001
RAX: ffffffffffffffda RBX: 0000000000000008 RCX: 00007f72d059a7a7
RDX: 0000000000000008 RSI: 000055fe42367730 RDI: 0000000000000003
RBP: 000055fe42367730 R08: 0000000000000000 R09: 00007f72d066ca00
R10: 000000000000007c R11: 0000000000000246 R12: 0000000000000008

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

