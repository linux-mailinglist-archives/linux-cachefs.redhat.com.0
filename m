Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id 1132828D561
	for <lists+linux-cachefs@lfdr.de>; Tue, 13 Oct 2020 22:31:17 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-450-XJJReO2tMCC8klhMTaxOMA-1; Tue, 13 Oct 2020 16:31:15 -0400
X-MC-Unique: XJJReO2tMCC8klhMTaxOMA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9DC6C18BE161;
	Tue, 13 Oct 2020 20:31:12 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8D8EC27CC5;
	Tue, 13 Oct 2020 20:31:12 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 7AED218327AA;
	Tue, 13 Oct 2020 20:31:12 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 09CK3TMo015508 for <linux-cachefs@listman.util.phx.redhat.com>;
	Mon, 12 Oct 2020 16:03:29 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 5069C207AE98; Mon, 12 Oct 2020 20:03:29 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4B77D207A816
	for <linux-cachefs@redhat.com>; Mon, 12 Oct 2020 20:03:27 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id DEE8F805F5D
	for <linux-cachefs@redhat.com>; Mon, 12 Oct 2020 20:03:26 +0000 (UTC)
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-188-syjPX97MP6yU_xaFUwVJsw-1; Mon, 12 Oct 2020 16:03:23 -0400
X-MC-Unique: syjPX97MP6yU_xaFUwVJsw-1
Received: from willy by casper.infradead.org with local (Exim 4.92.3 #3 (Red
	Hat Linux)) id 1kS422-0000HA-AX; Mon, 12 Oct 2020 20:02:54 +0000
Date: Mon, 12 Oct 2020 21:02:54 +0100
From: Matthew Wilcox <willy@infradead.org>
To: Ira Weiny <ira.weiny@intel.com>
Message-ID: <20201012200254.GB20115@casper.infradead.org>
References: <20201009195033.3208459-1-ira.weiny@intel.com>
	<20201009195033.3208459-23-ira.weiny@intel.com>
	<20201009213434.GA839@sol.localdomain>
	<20201010003954.GW20115@casper.infradead.org>
	<20201010013036.GD1122@sol.localdomain>
	<20201012065635.GB2046448@iweiny-DESK2.sc.intel.com>
	<20201012161946.GA858@sol.localdomain>
	<5d621db9-23d4-e140-45eb-d7fca2093d2b@intel.com>
	<20201012164438.GA20115@casper.infradead.org>
	<20201012195354.GC2046448@iweiny-DESK2.sc.intel.com>
MIME-Version: 1.0
In-Reply-To: <20201012195354.GC2046448@iweiny-DESK2.sc.intel.com>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-loop: linux-cachefs@redhat.com
X-Mailman-Approved-At: Tue, 13 Oct 2020 16:31:08 -0400
Cc: linux-aio@kvack.org, linux-efi@vger.kernel.org, kvm@vger.kernel.org,
	linux-doc@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>,
	linux-mmc@vger.kernel.org, Dave Hansen <dave.hansen@linux.intel.com>,
	dri-devel@lists.freedesktop.org, Dave Hansen <dave.hansen@intel.com>,
	target-devel@vger.kernel.org, linux-mtd@lists.infradead.org,
	linux-kselftest@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
	Thomas Gleixner <tglx@linutronix.de>, devel@driverdev.osuosl.org,
	linux-cifs@vger.kernel.org, linux-nilfs@vger.kernel.org,
	linux-scsi@vger.kernel.org, linux-nvdimm@lists.01.org,
	linux-rdma@vger.kernel.org, x86@kernel.org,
	amd-gfx@lists.freedesktop.org, linux-afs@lists.infradead.org,
	Eric Biggers <ebiggers@kernel.org>,
	Ingo Molnar <mingo@redhat.com>, intel-wired-lan@lists.osuosl.org,
	kexec@lists.infradead.org, xen-devel@lists.xenproject.org,
	linux-ext4@vger.kernel.org, bpf@vger.kernel.org,
	Dan Williams <dan.j.williams@intel.com>, Fenghua Yu <fenghua.yu@intel.com>,
	intel-gfx@lists.freedesktop.org, ecryptfs@vger.kernel.org,
	linux-um@lists.infradead.org, reiserfs-devel@vger.kernel.org,
	linux-block@vger.kernel.org, linux-bcache@vger.kernel.org,
	Borislav Petkov <bp@alien8.de>,
	Andy Lutomirski <luto@kernel.org>, drbd-dev@tron.linbit.com,
	Jaegeuk Kim <jaegeuk@kernel.org>, ceph-devel@vger.kernel.org,
	io-uring@vger.kernel.org, linux-cachefs@redhat.com,
	linux-nfs@vger.kernel.org, linux-mm@kvack.org,
	linux-ntfs-dev@lists.sourceforge.net, netdev@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, samba-technical@lists.samba.org,
	linux-kernel@vger.kernel.org, cluster-devel@redhat.com,
	linux-fsdevel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
	linux-erofs@lists.ozlabs.org, linux-btrfs@vger.kernel.org
Subject: Re: [Linux-cachefs] [PATCH RFC PKS/PMEM 22/58] fs/f2fs: Utilize new
	kmap_thread()
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, Oct 12, 2020 at 12:53:54PM -0700, Ira Weiny wrote:
> On Mon, Oct 12, 2020 at 05:44:38PM +0100, Matthew Wilcox wrote:
> > On Mon, Oct 12, 2020 at 09:28:29AM -0700, Dave Hansen wrote:
> > > kmap_atomic() is always preferred over kmap()/kmap_thread().
> > > kmap_atomic() is _much_ more lightweight since its TLB invalidation is
> > > always CPU-local and never broadcast.
> > > 
> > > So, basically, unless you *must* sleep while the mapping is in place,
> > > kmap_atomic() is preferred.
> > 
> > But kmap_atomic() disables preemption, so the _ideal_ interface would map
> > it only locally, then on preemption make it global.  I don't even know
> > if that _can_ be done.  But this email makes it seem like kmap_atomic()
> > has no downsides.
> 
> And that is IIUC what Thomas was trying to solve.
> 
> Also, Linus brought up that kmap_atomic() has quirks in nesting.[1]
> 
> >From what I can see all of these discussions support the need to have something
> between kmap() and kmap_atomic().
> 
> However, the reason behind converting call sites to kmap_thread() are different
> between Thomas' patch set and mine.  Both require more kmap granularity.
> However, they do so with different reasons and underlying implementations but
> with the _same_ resulting semantics; a thread local mapping which is
> preemptable.[2]  Therefore they each focus on changing different call sites.
> 
> While this patch set is huge I think it serves a valuable purpose to identify a
> large number of call sites which are candidates for this new semantic.

Yes, I agree.  My problem with this patch-set is that it ties it to
some Intel feature that almost nobody cares about.  Maybe we should
care about it, but you didn't try very hard to make anyone care about
it in the cover letter.

For a future patch-set, I'd like to see you just introduce the new
API.  Then you can optimise the Intel implementation of it afterwards.
Those patch-sets have entirely different reviewers.

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://www.redhat.com/mailman/listinfo/linux-cachefs

