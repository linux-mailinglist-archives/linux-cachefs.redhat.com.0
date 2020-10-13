Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id 9105E28D563
	for <lists+linux-cachefs@lfdr.de>; Tue, 13 Oct 2020 22:31:18 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-198-QdlYFVmsO465ir2s_L0g_Q-1; Tue, 13 Oct 2020 16:31:16 -0400
X-MC-Unique: QdlYFVmsO465ir2s_L0g_Q-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BCA2C18BE174;
	Tue, 13 Oct 2020 20:31:12 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A8DB15C230;
	Tue, 13 Oct 2020 20:31:12 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 90EFF1826D3D;
	Tue, 13 Oct 2020 20:31:12 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 09DJfuiw027875 for <linux-cachefs@listman.util.phx.redhat.com>;
	Tue, 13 Oct 2020 15:41:56 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 24CD02DF7AB; Tue, 13 Oct 2020 19:41:56 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1DAE22DF7B7
	for <linux-cachefs@redhat.com>; Tue, 13 Oct 2020 19:41:52 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0573180088F
	for <linux-cachefs@redhat.com>; Tue, 13 Oct 2020 19:41:52 +0000 (UTC)
Received: from mail-ej1-f66.google.com (mail-ej1-f66.google.com
	[209.85.218.66]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-396-YvWc-CAmOh-aocR8KLbD9w-1; Tue, 13 Oct 2020 15:41:49 -0400
X-MC-Unique: YvWc-CAmOh-aocR8KLbD9w-1
Received: by mail-ej1-f66.google.com with SMTP id a3so1407579ejy.11
	for <linux-cachefs@redhat.com>; Tue, 13 Oct 2020 12:41:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=jlOzF1QhqikCoQxsvfJV6M6Hjgbrow9dB9uNs1AoGLE=;
	b=H4bAS5a9URLLi/xPAc473OKszN2KbybeIexxZZpU73/4Zmen7lBwSQRjMcs+ZPDrT6
	/DHSiQWnWzFeaF3iQUKOv8YRsWauhQblpHaw0cc3ha45YvS5xEHgIM4sbFiQvnXbPPbo
	BA59sGEwR1KAgjZTkdG5eBGs8VpxLc9Nnh/pGKKd7UNM/5vn5W1l3pv1cPZ5JjaQSK0d
	rwx2LvEy9tZnM0umReISvW0ocdaFQmIzMsEDQfOkSH4I0a7uAJ5wqeEh4mSzQX9SM+A4
	Zj3TMtFFV9NixwU4QrJbhMj5S2yBsbeauc7TmyrWx4HQyR9M+DtinvS6/uad9rP+WU8T
	o83Q==
X-Gm-Message-State: AOAM531ekQNf1xbtcLHleP1D3x1Dzi32lJ1t+PnWI2AH9BOM8/nyMrVN
	1RjYtYRp+i1ni1nwbkp00DmdVlJ4GMS3juLYDxmv7Q==
X-Google-Smtp-Source: ABdhPJxGxhMZ7o2BYtIDXOupUr3pSHVXck0tIwC9HMZ0nIbp0pU6AQKRljKqMwVkoxmX0BYp74elTVEnpYvo3LWFH24=
X-Received: by 2002:a17:906:7e47:: with SMTP id
	z7mr1390518ejr.418.1602618108255; 
	Tue, 13 Oct 2020 12:41:48 -0700 (PDT)
MIME-Version: 1.0
References: <20201009195033.3208459-1-ira.weiny@intel.com>
	<20201009195033.3208459-34-ira.weiny@intel.com>
	<CAPcyv4gL3jfw4d+SJGPqAD3Dp4F_K=X3domuN4ndAA1FQDGcPg@mail.gmail.com>
	<20201013193643.GK20115@casper.infradead.org>
In-Reply-To: <20201013193643.GK20115@casper.infradead.org>
From: Dan Williams <dan.j.williams@intel.com>
Date: Tue, 13 Oct 2020 12:41:36 -0700
Message-ID: <CAPcyv4gL70FcLe8az7ezmpcZV=bG0Cka7daKWcCdmV4GoenSZw@mail.gmail.com>
To: Matthew Wilcox <willy@infradead.org>
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
X-Mailman-Approved-At: Tue, 13 Oct 2020 16:31:08 -0400
Cc: linux-aio@kvack.org, linux-efi <linux-efi@vger.kernel.org>,
	KVM list <kvm@vger.kernel.org>,
	Linux Doc Mailing List <linux-doc@vger.kernel.org>,
	Peter Zijlstra <peterz@infradead.org>, linux-mmc@vger.kernel.org,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
	Linux MM <linux-mm@kvack.org>, target-devel@vger.kernel.org,
	linux-mtd@lists.infradead.org, linux-kselftest@vger.kernel.org,
	samba-technical@lists.samba.org, "Weiny,
	Ira" <ira.weiny@intel.com>, ceph-devel@vger.kernel.org,
	devel@driverdev.osuosl.org, linux-cifs@vger.kernel.org,
	linux-nilfs@vger.kernel.org, linux-scsi <linux-scsi@vger.kernel.org>,
	linux-nvdimm <linux-nvdimm@lists.01.org>,
	linux-rdma <linux-rdma@vger.kernel.org>, X86 ML <x86@kernel.org>,
	amd-gfx list <amd-gfx@lists.freedesktop.org>,
	io-uring@vger.kernel.org, cluster-devel@redhat.com,
	Ingo Molnar <mingo@redhat.com>, intel-wired-lan@lists.osuosl.org,
	xen-devel <xen-devel@lists.xenproject.org>,
	linux-ext4 <linux-ext4@vger.kernel.org>,
	Fenghua Yu <fenghua.yu@intel.com>, linux-afs@lists.infradead.org,
	linux-um@lists.infradead.org, intel-gfx@lists.freedesktop.org,
	ecryptfs@vger.kernel.org, linux-erofs@lists.ozlabs.org,
	reiserfs-devel@vger.kernel.org, linux-block@vger.kernel.org,
	linux-bcache@vger.kernel.org, Borislav Petkov <bp@alien8.de>,
	Andy Lutomirski <luto@kernel.org>, drbd-dev@tron.linbit.com,
	Thomas Gleixner <tglx@linutronix.de>,
	Andrew Morton <akpm@linux-foundation.org>,
	linux-cachefs@redhat.com, linux-nfs@vger.kernel.org,
	Nicolas Pitre <nico@fluxnic.net>, linux-ntfs-dev@lists.sourceforge.net,
	Netdev <netdev@vger.kernel.org>,
	Kexec Mailing List <kexec@lists.infradead.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	linux-f2fs-devel@lists.sourceforge.net,
	linux-fsdevel <linux-fsdevel@vger.kernel.org>, bpf@vger.kernel.org,
	linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
	linux-btrfs <linux-btrfs@vger.kernel.org>
Subject: Re: [Linux-cachefs] [PATCH RFC PKS/PMEM 33/58] fs/cramfs: Utilize
	new kmap_thread()
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, Oct 13, 2020 at 12:37 PM Matthew Wilcox <willy@infradead.org> wrote:
>
> On Tue, Oct 13, 2020 at 11:44:29AM -0700, Dan Williams wrote:
> > On Fri, Oct 9, 2020 at 12:52 PM <ira.weiny@intel.com> wrote:
> > >
> > > From: Ira Weiny <ira.weiny@intel.com>
> > >
> > > The kmap() calls in this FS are localized to a single thread.  To avoid
> > > the over head of global PKRS updates use the new kmap_thread() call.
> > >
> > > Cc: Nicolas Pitre <nico@fluxnic.net>
> > > Signed-off-by: Ira Weiny <ira.weiny@intel.com>
> > > ---
> > >  fs/cramfs/inode.c | 10 +++++-----
> > >  1 file changed, 5 insertions(+), 5 deletions(-)
> > >
> > > diff --git a/fs/cramfs/inode.c b/fs/cramfs/inode.c
> > > index 912308600d39..003c014a42ed 100644
> > > --- a/fs/cramfs/inode.c
> > > +++ b/fs/cramfs/inode.c
> > > @@ -247,8 +247,8 @@ static void *cramfs_blkdev_read(struct super_block *sb, unsigned int offset,
> > >                 struct page *page = pages[i];
> > >
> > >                 if (page) {
> > > -                       memcpy(data, kmap(page), PAGE_SIZE);
> > > -                       kunmap(page);
> > > +                       memcpy(data, kmap_thread(page), PAGE_SIZE);
> > > +                       kunmap_thread(page);
> >
> > Why does this need a sleepable kmap? This looks like a textbook
> > kmap_atomic() use case.
>
> There's a lot of code of this form.  Could we perhaps have:
>
> static inline void copy_to_highpage(struct page *to, void *vfrom, unsigned int size)
> {
>         char *vto = kmap_atomic(to);
>
>         memcpy(vto, vfrom, size);
>         kunmap_atomic(vto);
> }
>
> in linux/highmem.h ?

Nice, yes, that could also replace the local ones in lib/iov_iter.c
(memcpy_{to,from}_page())

--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://www.redhat.com/mailman/listinfo/linux-cachefs

