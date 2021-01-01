Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id 8E7782E8359
	for <lists+linux-cachefs@lfdr.de>; Fri,  1 Jan 2021 10:11:51 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-78-gGZGQZioPzmtQGOg0ZqOig-1; Fri, 01 Jan 2021 04:11:48 -0500
X-MC-Unique: gGZGQZioPzmtQGOg0ZqOig-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 59A41E75C;
	Fri,  1 Jan 2021 09:11:44 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6C01260C05;
	Fri,  1 Jan 2021 09:11:42 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 97F684A7C6;
	Fri,  1 Jan 2021 09:11:38 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 1019BWms017407 for <linux-cachefs@listman.util.phx.redhat.com>;
	Fri, 1 Jan 2021 04:11:32 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 51CF02166B2A; Fri,  1 Jan 2021 09:11:32 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4C66B2166B28
	for <linux-cachefs@redhat.com>; Fri,  1 Jan 2021 09:11:29 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CE4D4185A794
	for <linux-cachefs@redhat.com>; Fri,  1 Jan 2021 09:11:29 +0000 (UTC)
Received: from mail-il1-f173.google.com (mail-il1-f173.google.com
	[209.85.166.173]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-505-Hz7kiyYVOg-eP0G6NHeXiA-1; Fri, 01 Jan 2021 04:11:25 -0500
X-MC-Unique: Hz7kiyYVOg-eP0G6NHeXiA-1
Received: by mail-il1-f173.google.com with SMTP id e7so15336563ile.7;
	Fri, 01 Jan 2021 01:11:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=X2l8jXmgzCuN61tTEQ25moyBAzJ1BiUjP0mOjFYN50o=;
	b=GvlIymOodDmwL15VVHfHmM/QIXcyQDMh27Dlvhm+0HvmkbbC85Z/0yuLmLwcge5ijW
	Ir6vclZyjq7uykql+ybJ96Zpnm0h6vJjUF2CyutCwJSDq2My4J872y910zf2V0XZRQgf
	UsUMarPLqoESkupTKRawJT7e5444rmphYHmZuXe6WeWbnVvDqLSYAbFYt04l5Q2fE6Oe
	UJCMWQCKbGHzvQRU2efsBREbhdwN3b+Dy8COcNWMGoCkRqUH9zkK0sTw9W9Q93ikEYzU
	fWaQW7U5c1D+nfItE8MpEwQDv5y6mLFtfBTrQGRGFvQS4ZMrW+J4wsN9Muq0ehR03z3P
	p2WA==
X-Gm-Message-State: AOAM530oMZfhJHUpoITAFfC5h+zS4f4IEA65zOF9HxLKs5Cxr3lYaioo
	s2O6HdgXskXyxUxwLkN0rjkPV4mYRVQuSU45nGeWw6/bI8zOQN41
X-Google-Smtp-Source: ABdhPJxNwRKMaNakmfdSUeZhoeeWiGLV1q1h71ajCe6X8/ZgEMII6dQtfkWzhQhOmTkKVKfe7R9/9idFYFS6Gtzrpvg=
X-Received: by 2002:a92:489b:: with SMTP id j27mr57901947ilg.168.1609492285011;
	Fri, 01 Jan 2021 01:11:25 -0800 (PST)
MIME-Version: 1.0
References: <20201222012131.47020-5-laoar.shao@gmail.com>
	<20201231030158.GB379@xsang-OptiPlex-9020>
In-Reply-To: <20201231030158.GB379@xsang-OptiPlex-9020>
From: Yafang Shao <laoar.shao@gmail.com>
Date: Fri, 1 Jan 2021 17:10:49 +0800
Message-ID: <CALOAHbD+mLMJSizToKPsx0iUd5Z71sJBOyMaV2enVvUHfHwLzg@mail.gmail.com>
To: kernel test robot <oliver.sang@intel.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 1019BWms017407
X-loop: linux-cachefs@redhat.com
Cc: Christoph Hellwig <hch@infradead.org>, 0day robot <lkp@intel.com>,
	"Darrick J. Wong" <darrick.wong@oracle.com>,
	Dave Chinner <david@fromorbit.com>, LKML <linux-kernel@vger.kernel.org>,
	Matthew Wilcox <willy@infradead.org>,
	Michal Hocko <mhocko@kernel.org>, lkp@lists.01.org,
	linux-cachefs@redhat.com, Linux MM <linux-mm@kvack.org>,
	linux-fsdevel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
	linux-xfs@vger.kernel.org, Christoph Hellwig <hch@lst.de>
Subject: Re: [Linux-cachefs] [xfs] db962cd266: Assertion_failed
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Dec 31, 2020 at 10:46 AM kernel test robot
<oliver.sang@intel.com> wrote:
>
>
> Greeting,
>
> FYI, we noticed the following commit (built with gcc-9):
>
> commit: db962cd266c4d3230436aec2899186510797d49f ("[PATCH v14 4/4] xfs: use current->journal_info to avoid transaction reservation recursion")
> url: https://github.com/0day-ci/linux/commits/Yafang-Shao/xfs-avoid-transaction-reservation-recursion/20201222-092315
> base: https://git.kernel.org/cgit/fs/xfs/xfs-linux.git for-next
>
> in testcase: filebench
> version: filebench-x86_64-22620e6-1_20201112
> with following parameters:
>
>         disk: 1HDD
>         fs: btrfs
>         test: fivestreamwrite.f
>         cpufreq_governor: performance
>         ucode: 0x42e
>
>
>
> on test machine: 48 threads Intel(R) Xeon(R) CPU E5-2697 v2 @ 2.70GHz with 112G memory
>
> caused below changes (please refer to attached dmesg/kmsg for entire log/backtrace):
>
>
> If you fix the issue, kindly add following tag
> Reported-by: kernel test robot <oliver.sang@intel.com>
>
>
> [  552.503501]
> [  552.525993] /usr/bin/wget -q --timeout=1800 --tries=1 --local-encoding=UTF-8 http://internal-lkp-server:80/~lkp/pkg/linux/x86_64-rhel-8.3/gcc-9/5c8fe583cce542aa0b84adc939ce85293de36e5e/modules.cgz -N -P /opt/rootfs/tmp/pkg/linux/x86_64-rhel-8.3/gcc-9/5c8fe583cce542aa0b84adc939ce85293de36e5e
> [  552.525995]
> [  552.884581] /opt/rootfs/tmp/pkg/linux/x86_64-rhel-8.3/gcc-9/5c8fe583cce542aa0b84adc939ce85293de36e5e/modules.cgz isn't modified
> [  552.884583]
> [  552.905799] XFS: Assertion failed: !current->journal_info, file: fs/xfs/xfs_trans.h, line: 280
> [  552.907594] /usr/bin/wget -q --timeout=1800 --tries=1 --local-encoding=UTF-8 http://internal-lkp-server:80/~lkp/osimage/ucode/intel-ucode-20201117.cgz -N -P /opt/rootfs/tmp/osimage/ucode
> [  552.916568]
> [  552.916574] ------------[ cut here ]------------
> [  552.939361] /opt/rootfs/tmp/osimage/ucode/intel-ucode-20201117.cgz isn't modified
> [  552.940036] kernel BUG at fs/xfs/xfs_message.c:110!
> [  552.946338]
> [  552.955784] invalid opcode: 0000 [#1] SMP PTI
> [  552.971010] CPU: 46 PID: 3793 Comm: kexec-lkp Not tainted 5.10.0-rc5-00044-gdb962cd266c4 #1
> [  552.981331] Hardware name: Intel Corporation S2600WP/S2600WP, BIOS SE5C600.86B.02.02.0002.122320131210 12/23/2013
> [  552.993907] RIP: 0010:assfail+0x23/0x28 [xfs]
> [  552.999797] Code: 67 fc ff ff 0f 0b c3 0f 1f 44 00 00 41 89 c8 48 89 d1 48 89 f2 48 c7 c6 30 58 be c0 e8 82 f9 ff ff 80 3d b1 80 0a 00 00 74 02 <0f> 0b 0f 0b c3 48 8d 45 10 48 89 e2 4c 89 e6 48 89 1c 24 48 89 44
> [  553.022798] RSP: 0018:ffffc90006a139c8 EFLAGS: 00010202
> [  553.029624] RAX: 0000000000000000 RBX: ffff889c3edea700 RCX: 0000000000000000
> [  553.038646] RDX: 00000000ffffffc0 RSI: 000000000000000a RDI: ffffffffc0bd7bab
> [  553.047600] RBP: ffffc90006a13a14 R08: 0000000000000000 R09: 0000000000000000
> [  553.056536] R10: 000000000000000a R11: f000000000000000 R12: 0000000000000000
> [  553.065546] R13: 0000000000000000 R14: ffff889c3ede91c8 R15: ffff888f44608000
> [  553.074455] FS:  00007ffff7fc9580(0000) GS:ffff889bea380000(0000) knlGS:0000000000000000
> [  553.084494] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> [  553.091837] CR2: 00005555555a1420 CR3: 0000001c30fbe002 CR4: 00000000001706e0
> [  553.100720] Call Trace:
> [  553.104459]  xfs_trans_reserve+0x225/0x320 [xfs]
> [  553.110556]  xfs_trans_roll+0x6e/0xe0 [xfs]
> [  553.116134]  xfs_defer_trans_roll+0x104/0x2a0 [xfs]
> [  553.122489]  ? xfs_extent_free_create_intent+0x62/0xc0 [xfs]
> [  553.129780]  xfs_defer_finish_noroll+0xb8/0x620 [xfs]
> [  553.136299]  xfs_defer_finish+0x11/0xa0 [xfs]
> [  553.142017]  xfs_itruncate_extents_flags+0x141/0x440 [xfs]
> [  553.149053]  xfs_setattr_size+0x3da/0x480 [xfs]
> [  553.154939]  ? setattr_prepare+0x6a/0x1e0
> [  553.160250]  xfs_vn_setattr+0x70/0x120 [xfs]
> [  553.165833]  notify_change+0x364/0x500
> [  553.170820]  ? do_truncate+0x76/0xe0
> [  553.175673]  do_truncate+0x76/0xe0
> [  553.180184]  path_openat+0xe6c/0x10a0
> [  553.184981]  do_filp_open+0x91/0x100
> [  553.189707]  ? __check_object_size+0x136/0x160
> [  553.195493]  do_sys_openat2+0x20d/0x2e0
> [  553.200481]  do_sys_open+0x44/0x80
> [  553.204926]  do_syscall_64+0x33/0x40
> [  553.209588]  entry_SYSCALL_64_after_hwframe+0x44/0xa9
> [  553.215867] RIP: 0033:0x7ffff7ef11ae
> [  553.220579] Code: 25 00 00 41 00 3d 00 00 41 00 74 48 48 8d 05 59 65 0d 00 8b 00 85 c0 75 69 89 f2 b8 01 01 00 00 48 89 fe bf 9c ff ff ff 0f 05 <48> 3d 00 f0 ff ff 0f 87 a6 00 00 00 48 8b 4c 24 28 64 48 33 0c 25
> [  553.242870] RSP: 002b:00007fffffffc980 EFLAGS: 00000246 ORIG_RAX: 0000000000000101
> [  553.251949] RAX: ffffffffffffffda RBX: 000055555556afcc RCX: 00007ffff7ef11ae
> [  553.260586] RDX: 0000000000000241 RSI: 00005555555aaa40 RDI: 00000000ffffff9c
> [  553.269217] RBP: 0000555555577bd0 R08: 00005555555a250f R09: 00005555555783b0
> [  553.277804] R10: 00000000000001b6 R11: 0000000000000246 R12: 00005555555aaa40
> [  553.286406] R13: 00000000fffffffd R14: 00005555555a1400 R15: 0000000000000010
> [  553.294926] Modules linked in: dm_mod xfs btrfs blake2b_generic xor zstd_compress raid6_pq libcrc32c sd_mod t10_pi sg intel_rapl_msr intel_rapl_common sb_edac x86_pkg_temp_thermal intel_powerclamp coretemp kvm_intel kvm mgag200 irqbypass crct10dif_pclmul drm_kms_helper crc32_pclmul crc32c_intel ghash_clmulni_intel isci syscopyarea sysfillrect sysimgblt rapl fb_sys_fops ahci libsas libahci ipmi_si scsi_transport_sas mei_me intel_cstate ipmi_devintf ioatdma drm mei intel_uncore ipmi_msghandler libata dca wmi joydev ip_tables
> [  553.349820] ---[ end trace 41e34856cd03d8f3 ]---
> [  553.359002] RIP: 0010:assfail+0x23/0x28 [xfs]
> [  553.364558] Code: 67 fc ff ff 0f 0b c3 0f 1f 44 00 00 41 89 c8 48 89 d1 48 89 f2 48 c7 c6 30 58 be c0 e8 82 f9 ff ff 80 3d b1 80 0a 00 00 74 02 <0f> 0b 0f 0b c3 48 8d 45 10 48 89 e2 4c 89 e6 48 89 1c 24 48 89 44
> [  553.386866] RSP: 0018:ffffc90006a139c8 EFLAGS: 00010202
> [  553.393357] RAX: 0000000000000000 RBX: ffff889c3edea700 RCX: 0000000000000000
> [  553.402093] RDX: 00000000ffffffc0 RSI: 000000000000000a RDI: ffffffffc0bd7bab
> [  553.410746] RBP: ffffc90006a13a14 R08: 0000000000000000 R09: 0000000000000000
> [  553.419499] R10: 000000000000000a R11: f000000000000000 R12: 0000000000000000
> [  553.428122] R13: 0000000000000000 R14: ffff889c3ede91c8 R15: ffff888f44608000
> [  553.436764] FS:  00007ffff7fc9580(0000) GS:ffff889bea380000(0000) knlGS:0000000000000000
> [  553.446562] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> [  553.453670] CR2: 00005555555a1420 CR3: 0000001c30fbe002 CR4: 00000000001706e0
> [  553.462302] Kernel panic - not syncing: Fatal exception
> [  553.513856] Kernel Offset: disabled
> ACPI MEMORY or I/O RESET_REG.
>
>
> To reproduce:
>
>         git clone https://github.com/intel/lkp-tests.git
>         cd lkp-tests
>         bin/lkp install job.yaml  # job file is attached in this email
>         bin/lkp run     job.yaml
>
>
>
> Thanks,
> Oliver Sang
>

Thanks for the report.

At a first glance, it seems we should make a similar change as we did
in xfs_trans_context_clear().

static inline void
xfs_trans_context_set(struct xfs_trans *tp)
{
    /*
     * We have already handed over the context via xfs_trans_context_swap().
     */
    if (current->journal_info)
        return;
    current->journal_info = tp;
    tp->t_pflags = memalloc_nofs_save();
}


I will analyze and retest it.

-- 
Thanks
Yafang


--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://www.redhat.com/mailman/listinfo/linux-cachefs

