Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 4E138279808
	for <lists+linux-cachefs@lfdr.de>; Sat, 26 Sep 2020 11:00:48 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-189-jz4dJ7H0PMayaZd5SNaCuA-1; Sat, 26 Sep 2020 05:00:44 -0400
X-MC-Unique: jz4dJ7H0PMayaZd5SNaCuA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D160281F02E;
	Sat, 26 Sep 2020 09:00:41 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5163578802;
	Sat, 26 Sep 2020 09:00:40 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 469D044A4F;
	Sat, 26 Sep 2020 09:00:36 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 08Q90VgG004074 for <linux-cachefs@listman.util.phx.redhat.com>;
	Sat, 26 Sep 2020 05:00:32 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id C372B10F99D; Sat, 26 Sep 2020 09:00:31 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id BEB8610F058
	for <linux-cachefs@redhat.com>; Sat, 26 Sep 2020 09:00:29 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1AD5A800296
	for <linux-cachefs@redhat.com>; Sat, 26 Sep 2020 09:00:29 +0000 (UTC)
Received: from natter.dneg.com (natter.dneg.com [193.203.89.68]) (Using TLS)
	by relay.mimecast.com with ESMTP id us-mta-371-Md4cPpsENBa5DqtVLB_26w-1;
	Sat, 26 Sep 2020 05:00:25 -0400
X-MC-Unique: Md4cPpsENBa5DqtVLB_26w-1
Received: from localhost (localhost [127.0.0.1])
	by natter.dneg.com (Postfix) with ESMTP id CD6B06B775B3;
	Sat, 26 Sep 2020 10:00:23 +0100 (BST)
X-Virus-Scanned: amavisd-new at mx-dneg
Received: from natter.dneg.com ([127.0.0.1])
	by localhost (natter.dneg.com [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id Ly-5u7SOEaQj; Sat, 26 Sep 2020 10:00:23 +0100 (BST)
Received: from zrozimbrai.dneg.com (zrozimbrai.dneg.com [10.11.20.12])
	by natter.dneg.com (Postfix) with ESMTPS id A839E6B775AC;
	Sat, 26 Sep 2020 10:00:23 +0100 (BST)
Received: from localhost (localhost [127.0.0.1])
	by zrozimbrai.dneg.com (Postfix) with ESMTP id 1AF6682771A9;
	Sat, 26 Sep 2020 10:00:06 +0100 (BST)
Received: from zrozimbrai.dneg.com ([127.0.0.1])
	by localhost (zrozimbrai.dneg.com [127.0.0.1]) (amavisd-new, port 10032)
	with ESMTP id vPFNQNTM_J_4; Sat, 26 Sep 2020 10:00:06 +0100 (BST)
Received: from localhost (localhost [127.0.0.1])
	by zrozimbrai.dneg.com (Postfix) with ESMTP id F38AE82E0B65;
	Sat, 26 Sep 2020 10:00:05 +0100 (BST)
X-Virus-Scanned: amavisd-new at zimbra-dneg
Received: from zrozimbrai.dneg.com ([127.0.0.1])
	by localhost (zrozimbrai.dneg.com [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id 4A8uB4JaJzZw; Sat, 26 Sep 2020 10:00:05 +0100 (BST)
Received: from zrozimbra1.dneg.com (zrozimbra1.dneg.com [10.11.16.16])
	by zrozimbrai.dneg.com (Postfix) with ESMTP id A484C82771A9;
	Sat, 26 Sep 2020 10:00:05 +0100 (BST)
Date: Sat, 26 Sep 2020 10:00:22 +0100 (BST)
From: Daire Byrne <daire@dneg.com>
To: Frank van der Linden <fllinden@amazon.com>
Message-ID: <108670779.52656705.1601110822013.JavaMail.zimbra@dneg.com>
In-Reply-To: <20200923210157.GA1650@dev-dsk-fllinden-2c-c1893d73.us-west-2.amazon.com>
References: <943482310.31162206.1599499860595.JavaMail.zimbra@dneg.com>
	<20200915172140.GA32632@fieldses.org>
	<2001715792.39705019.1600358470997.JavaMail.zimbra@dneg.com>
	<20200917190931.GA6858@fieldses.org>
	<20200917202303.GA29892@dev-dsk-fllinden-2c-c1893d73.us-west-2.amazon.com>
	<76A4DC7D-D4F7-4A17-A67D-282E8522132A@oracle.com>
	<1790619463.44171163.1600892707423.JavaMail.zimbra@dneg.com>
	<20200923210157.GA1650@dev-dsk-fllinden-2c-c1893d73.us-west-2.amazon.com>
MIME-Version: 1.0
Thread-Topic: Adventures in NFS re-exporting
Thread-Index: 4WmCoHxmjSXA6hhowxqEPgGqXdbHgg==
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
Cc: bfields <bfields@fieldses.org>, linux-cachefs <linux-cachefs@redhat.com>,
	linux-nfs <linux-nfs@vger.kernel.org>, Chuck Lever <chuck.lever@oracle.com>
Subject: Re: [Linux-cachefs] Adventures in NFS re-exporting
X-BeenThere: linux-cachefs@redhat.com
X-Mailman-Version: 2.1.12
Precedence: junk
List-Id: Linux filesystem caching discussion list <linux-cachefs.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/linux-cachefs>,
	<mailto:linux-cachefs-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-cachefs>
List-Post: <mailto:linux-cachefs@redhat.com>
List-Help: <mailto:linux-cachefs-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-cachefs>,
	<mailto:linux-cachefs-request@redhat.com?subject=subscribe>
Sender: linux-cachefs-bounces@redhat.com
Errors-To: linux-cachefs-bounces@redhat.com
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

----- On 23 Sep, 2020, at 22:01, Frank van der Linden fllinden@amazon.com wrote:

> On Wed, Sep 23, 2020 at 09:25:07PM +0100, Daire Byrne wrote:
>> 
>> ----- On 22 Sep, 2020, at 17:43, Chuck Lever chuck.lever@oracle.com wrote:
>> >> On Sep 17, 2020, at 4:23 PM, Frank van der Linden <fllinden@amazon.com> wrote:
>> >>
>> >> On Thu, Sep 17, 2020 at 03:09:31PM -0400, bfields wrote:
>> >>>
>> >>> On Thu, Sep 17, 2020 at 05:01:11PM +0100, Daire Byrne wrote:
>> >>>>
>> >>>> ----- On 15 Sep, 2020, at 18:21, bfields bfields@fieldses.org wrote:
>> >>>>
>> >>>>>> 4) With an NFSv4 re-export, lots of open/close requests (hundreds per
>> >>>>>> second) quickly eat up the CPU on the re-export server and perf top
>> >>>>>> shows we are mostly in native_queued_spin_lock_slowpath.
>> >>>>>
>> >>>>> Any statistics on who's calling that function?
>> >>>>
>> >>>> I've always struggled to reproduce this with a simple open/close simulation, so
>> >>>> I suspect some other operations need to be mixed in too. But I have one
>> >>>> production workload that I know has lots of opens & closes (buggy software)
>> >>>> included in amongst the usual reads, writes etc.
>> >>>>
>> >>>> With just 40 clients mounting the reexport server (v5.7.6) using NFSv4.2, we see
>> >>>> the CPU of the nfsd threads increase rapidly and by the time we have 100
>> >>>> clients, we have maxed out the 32 cores of the server with most of that in
>> >>>> native_queued_spin_lock_slowpath.
>> >>>
>> >>> That sounds a lot like what Frank Van der Linden reported:
>> >>>
>> >>>        https://lore.kernel.org/linux-nfs/20200608192122.GA19171@dev-dsk-fllinden-2c-c1893d73.us-west-2.amazon.com/
>> >>>
>> >>> It looks like a bug in the filehandle caching code.
>> >>>
>> >>> --b.
>> >>
>> >> Yes, that does look like the same one.
>> >>
>> >> I still think that not caching v4 files at all may be the best way to go
>> >> here, since the intent of the filecache code was to speed up v2/v3 I/O,
>> >> where you end up doing a lot of opens/closes, but it doesn't make as
>> >> much sense for v4.
>> >>
>> >> However, short of that, I tested a local patch a few months back, that
>> >> I never posted here, so I'll do so now. It just makes v4 opens in to
>> >> 'long term' opens, which do not get put on the LRU, since that doesn't
>> >> make sense (they are in the hash table, so they are still cached).
>> >>
>> >> Also, the file caching code seems to walk the LRU a little too often,
>> >> but that's another issue - and this change keeps the LRU short, so it's
>> >> not a big deal.
>> >>
>> >> I don't particularly love this patch, but it does keep the LRU short, and
>> >> did significantly speed up my testcase (by about 50%). So, maybe you can
>> >> give it a try.
>> >>
>> >> I'll also attach a second patch, that converts the hash table to an rhashtable,
>> >> which automatically grows and shrinks in size with usage. That patch also
>> >> helped, but not by nearly as much (I think it yielded another 10%).
>> >
>> > For what it's worth, I applied your two patches to my test server, along
>> > with my patch that force-closes cached file descriptors during NFSv4
>> > CLOSE processing. The patch combination improves performance (faster
>> > elapsed time) for my workload as well.
>> 
>> I tested Frank's NFSv4 filecache patches with some production workloads and I've
>> hit the below refcount issue a couple of times in the last 48 hours with
>> v5.8.10. This server was re-exporting an NFS client mount at the time.
>> 
>> Apologies for the spam if I've just hit something unrelated to the patches that
>> is present in v5.8.10.... In truth, I have not used this kernel version before
>> with this workload and just patched it because I had it ready to go. I'll
>> remove the 2 patches and verify.
>> 
>> Daire
>> 
>> 
>> [ 8930.027838] ------------[ cut here ]------------
>> [ 8930.032769] refcount_t: addition on 0; use-after-free.
>> [ 8930.038251] WARNING: CPU: 2 PID: 3624 at lib/refcount.c:25
>> refcount_warn_saturate+0x6e/0xf0
>> [ 8930.046799] Modules linked in: tcp_diag inet_diag rpcsec_gss_krb5 nfsv4
>> dns_resolver act_mirred sch_ingress ifb nfsv3 nfs cls_u32 sch_fq sch_prio
>> cachefiles fscache ext4 mbcache jbd2 sb_edac rapl sg virtio_rng i2c_piix4
>> input_leds nfsd auth_rpcgss nfs_acl lockd grace binfmt_misc ip_tables xfs
>> libcrc32c sd_mod t10_pi 8021q garp mrp virtio_net net_failover failover
>> virtio_scsi crct10dif_pclmul crc32_pclmul crc32c_intel ghash_clmulni_intel
>> aesni_intel scsi_transport_iscsi crypto_simd cryptd glue_helper virtio_pci
>> virtio_ring virtio serio_raw sunrpc dm_mirror dm_region_hash dm_log dm_mod
>> [ 8930.098703] CPU: 2 PID: 3624 Comm: nfsd Tainted: G        W
>> 5.8.10-1.dneg.x86_64 #1
>> [ 8930.107391] Hardware name: Google Google Compute Engine/Google Compute
>> Engine, BIOS Google 01/01/2011
>> [ 8930.116775] RIP: 0010:refcount_warn_saturate+0x6e/0xf0
>> [ 8930.122078] Code: 49 91 18 01 01 e8 57 d6 c2 ff 0f 0b 5d c3 80 3d 38 91 18 01
>> 00 75 d1 48 c7 c7 d0 5c 13 82 c6 05 28 91 18 01 01 e8 37 d6 c2 ff <0f> 0b 5d c3
>> 80 3d 1a 91 18 01 00 75 b1 48 c7 c7 a8 5c 13 82 c6 05
>> [ 8930.141107] RSP: 0018:ffffc900012efc70 EFLAGS: 00010282
>> [ 8930.146497] RAX: 0000000000000000 RBX: ffff888cc12811e0 RCX: 0000000000000000
>> [ 8930.153793] RDX: ffff888d0bca8f20 RSI: ffff888d0bc98d40 RDI: ffff888d0bc98d40
>> [ 8930.161087] RBP: ffffc900012efc70 R08: ffff888d0bc98d40 R09: 0000000000000019
>> [ 8930.168380] R10: 000000000000072e R11: ffffc900012efad8 R12: ffff888b8bdad600
>> [ 8930.175680] R13: ffff888cd428ebe0 R14: ffff8889264f9170 R15: 0000000000000000
>> [ 8930.182976] FS:  0000000000000000(0000) GS:ffff888d0bc80000(0000)
>> knlGS:0000000000000000
>> [ 8930.191231] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
>> [ 8930.197139] CR2: 00007fbe43ca1248 CR3: 0000000ce48ee004 CR4: 00000000001606e0
>> [ 8930.204436] DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
>> [ 8930.211734] DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
>> [ 8930.219027] Call Trace:
>> [ 8930.221665]  nfsd4_process_open2+0xa48/0xec0 [nfsd]
>> [ 8930.226724]  ? nfsd_permission+0x6b/0x100 [nfsd]
>> [ 8930.231524]  ? fh_verify+0x167/0x210 [nfsd]
>> [ 8930.235893]  nfsd4_open+0x407/0x820 [nfsd]
>> [ 8930.240248]  nfsd4_proc_compound+0x3c2/0x760 [nfsd]
>> [ 8930.245296]  ? nfsd4_decode_compound.constprop.0+0x3a9/0x450 [nfsd]
>> [ 8930.251734]  nfsd_dispatch+0xe2/0x220 [nfsd]
>> [ 8930.256213]  svc_process_common+0x47b/0x6f0 [sunrpc]
>> [ 8930.261355]  ? svc_sock_secure_port+0x16/0x30 [sunrpc]
>> [ 8930.266707]  ? nfsd_svc+0x330/0x330 [nfsd]
>> [ 8930.270981]  svc_process+0xc5/0x100 [sunrpc]
>> [ 8930.275423]  nfsd+0xe8/0x150 [nfsd]
>> [ 8930.280028]  kthread+0x114/0x150
>> [ 8930.283434]  ? nfsd_destroy+0x60/0x60 [nfsd]
>> [ 8930.287875]  ? kthread_park+0x90/0x90
>> [ 8930.291700]  ret_from_fork+0x22/0x30
>> [ 8930.295447] ---[ end trace c551536c3520545c ]---
> 
> It's entirely possible that my patch introduces a refcounting error - it was
> intended as a proof-of-concept on how to fix the LRU locking issue for v4
> open file caching (while keeping it enabled) - which is why I didn't
> "formally" send it in.
> 
> Having said that, I don't immediately see the problem.
> 
> Maybe try it without the rhashtable patch, that is much less of an
> optimization.
> 
> The problem would have to be nf_ref as part of nfsd_file, or fi_ref as part
> of nfs4_file. If it's the latter, it's probably the rhashtable change.

Thanks Frank; I think you are right in that it seems to be a problem with the rhashtable patch. Another 48 hours using the same workload with just the main patch and I have not seen the same issue again so far.

Also, it still has the effect of reducing the CPU usage dramatically such that there are plenty of cores still left idle. This is actually helping us buy some more time while we fix our obviously broken software so that it doesn't open/close so crazily.

So, many thanks for that.

Daire

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://www.redhat.com/mailman/listinfo/linux-cachefs

