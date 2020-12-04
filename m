Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id 7CEAF2CF385
	for <lists+linux-cachefs@lfdr.de>; Fri,  4 Dec 2020 19:04:04 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-418-LSpr2ms3Pj-koGN6cHGWnQ-1; Fri, 04 Dec 2020 13:04:01 -0500
X-MC-Unique: LSpr2ms3Pj-koGN6cHGWnQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 009A3801FDC;
	Fri,  4 Dec 2020 18:03:58 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 581035C1D1;
	Fri,  4 Dec 2020 18:03:57 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 477DE1809CA0;
	Fri,  4 Dec 2020 18:03:54 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0B4I3og5018186 for <linux-cachefs@listman.util.phx.redhat.com>;
	Fri, 4 Dec 2020 13:03:50 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 3E84610846E; Fri,  4 Dec 2020 18:03:50 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3885B108476
	for <linux-cachefs@redhat.com>; Fri,  4 Dec 2020 18:03:45 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C2FAB10580C2
	for <linux-cachefs@redhat.com>; Fri,  4 Dec 2020 18:03:45 +0000 (UTC)
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com
	[209.85.214.169]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-163-T7ih1JExP2iw1yEWD-8w_w-1; Fri, 04 Dec 2020 13:03:42 -0500
X-MC-Unique: T7ih1JExP2iw1yEWD-8w_w-1
Received: by mail-pl1-f169.google.com with SMTP id 4so3540733plk.5;
	Fri, 04 Dec 2020 10:03:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=Husteve6EDOEbLKtDisOHgWM7wMYhfMwKaOZvHAB7Ss=;
	b=WprBwz4Z+bdyFc4oRtdB0PVVmjL3ctf568AjBce6lQ6/l/PTa4MJ+LncojBmq/fUSN
	k8rjKgGLoKQu/Hm6dAVXV8Zho7UrL+dkYs5lYyXKlhRMwTAeewK4AJ7Oh9J7zTNaDWrS
	UZotEBJJkm4USiATHAs1nfiDRYeGPBvmilgEW/mfjMgZMVYul1HQ3+2Zi6EAfC+CyY34
	Iqju/bIOJ0d5q5nn1t7rcYBcrw9SMPVBnIl9PS1vZBa2f9qfrZ+972uwyMbSVN+5oRF+
	oQ/yT5JeI+/zYFmm92zM1RN8aMdfZRgAWRvGrQGwdTnVLgolvQAj72Pjhl5HKWb3pnG8
	iT/w==
X-Gm-Message-State: AOAM533e2eunr625WN7s35H744+cnGOoYDS7Yg3bvL3jLtlIS6Hjqsnf
	+Zs3mY6gh0zvHIzxHEnqG2Um+7seIrenFr2AcdpWJKbRgbQ=
X-Google-Smtp-Source: ABdhPJxrjNDBWWK0TRqF3TpOw5OcuJPh8MkbwGat73V0AiOgX7m6/m7Xvbx2fYoVjpXdXt+cYd39vn4hzCxLF0bPwWE=
X-Received: by 2002:a17:902:ab98:b029:d8:c5e8:978a with SMTP id
	f24-20020a170902ab98b02900d8c5e8978amr4758419plr.56.1607105020565;
	Fri, 04 Dec 2020 10:03:40 -0800 (PST)
MIME-Version: 1.0
References: <CALF+zOniUVE05=JnhHwqshq843rUH_Pm5gKewFL-oi3PFbLdMA@mail.gmail.com>
	<CAB3bAB8iJ2Gw6O=OmY_u-ucKXv_3VAy59Janx7JjJ682NWZjKg@mail.gmail.com>
	<CALF+zOkKOUL+Dr8ELk6sFLsOR3-AO0FqKnoZRmJqJx=WHRgxFw@mail.gmail.com>
In-Reply-To: <CALF+zOkKOUL+Dr8ELk6sFLsOR3-AO0FqKnoZRmJqJx=WHRgxFw@mail.gmail.com>
From: Daire Byrne <daire.byrne@gmail.com>
Date: Fri, 4 Dec 2020 18:03:29 +0000
Message-ID: <CAB3bAB-eb6AFzo8v=C=kUMdsLr4YC_wGjufk2NYC32GaAd3O_w@mail.gmail.com>
To: David Wysochanski <dwysocha@redhat.com>
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
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: linux-cachefs@redhat.com
Subject: Re: [Linux-cachefs] NFS conversion to new netfs and fscache APIs
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

David,

Okay, I spent a little more time on this today and I think we can forget
about the re-export thing for a moment.

I looked at what was happening and the issue seemed to be that once I had
multiple clients of the re-export server (which has the iter fscache and
fsc enabled mounts) all reading the same files at the same time (for the
first time), then we often ended up with a missing sequential chunk of data
from the cached file.

The size and apparent size seemed to be the same as the original file on
the server but md5sum and hexdump against the client mounted file showed
otherwise.

So then I tried to replicate this scenario in the simplest way using just a
single (fscache-iter) client with an fsc enabled mountpoint using multiple
processes to read the same uncached file for the first time (no NFS
re-exporting).

* client1 mounts the NFS server without fsc
* client2 mounts the NFS server with fsc (with fscache-iter).

client1 # md5sum /mnt/server/file.1
9ca99335b6f75a300dc22e45a776440c
client2 # cat /mnt/server/file.1
client2 # md5sum /mnt/server/file.1
9ca99335b6f75a300dc22e45a776440c

All good. The files was cached to disk and looks good. Now let's read the
an uncached file using multiple processes simultaneously:

client1 # md5sum /mnt/server/file.2
9ca99335b6f75a300dc22e45a776440c
client2 # for x in {1..10}; do (cat /mnt/server/file.2 > /dev/null &);
done; wait
client2 # md5sum /mnt/server/file.2
26dd67fbf206f734df30fdec72d71429

The file is now different/corrupt. So in my re-export case it's just that
we have multiple knfsd processes reading in the same file simultaneously
for the first time into cache. Then it remains corrupt and serves that out
to multiple NFS clients.

In this case the backing filesystem was ext4 and the nfs client mount
options were fsc,vers=4.2 (vers=3 is the same). The NFS server is running
RHEL7.4.

Daire

On Thu, Dec 3, 2020 at 4:27 PM David Wysochanski <dwysocha@redhat.com>
wrote:

> On Wed, Dec 2, 2020 at 12:01 PM Daire Byrne <daire.byrne@gmail.com> wrote:
> >
> > David,
> >
> > First off, thanks for the work on this - we look forward to this landing.
> >
>
> Yeah no problem - thank you for your interest and testing it!
>
> > I did some very quick tests of just the bandwidth using server class
> networking (40Gbit) and storage (NVMe).
> >
> > Comparing the old fscache with the new one, we saw a minimal degradation
> in reading back from the backing disk. But I am putting this more down the
> the more directio style of access in the new version.
> >
> > This can be seen when the cache is being written as we no longer use the
> writeback cache. I'm assuming something similar happens on reads so that we
> don't use readahead?
> >
>
> Without getting into it too much and just guessing, I'd guess either
> it's the usage of directIO or the limitation of the 1GB in cachefiles,
> but not sure.  We need to drill down of course into it because it
> could be a lot of things.
>
> > Anyway, the quick summary of performance using 10 threads of reads
> follows. I should mention that the NVMe has a physical limit of ~2,500MB/s
> writes & 5,000MB/s reads:
> >
> > iter fscache:
> > uncached first reads ~2,500MB/s (writing to nvme ext4/xfs)
> > cached subsequent reads ~4,200 (reading from nvme ext4)
> > cached subsequent reads ~3,500 (reading from nvme xfs)
> >
> > old fscache:
> > uncached first reads ~2,500MB/s (writing to nvme ext4/xfs)
> > cached subsequent reads ~5,000 (reading from nvme ext4)
> > xfs crashes a lot ...
> >
> > I have not done a thorough analysis of CPU usage or perf top differences
> yet.
> >
> > Then I went on to test our rather unique NFS re-export workload where we
> take this fscache backed server and re-export the fsc mounts to many
> clients. At this point something odd appeared to be happening. The clients
> were loading software from the fscache backed mounts but were often
> segfaulting at various points. This suggested that they were getting
> corrupted data or the memory mapping (binaries, libraries) was failing in
> some way. Perhaps some odd interaction between fscache and knfsd?
> >
> > I did a quick test of re-export without the fsc caching enabled on the
> server mounts (with the same 5.10-rc kernel) and I didn't get any errors.
> That's as far as I got before I got drawn away by other things. I hope to
> dig into it a little more next week. But I just thought I'd give some quick
> feedback of one potential difference I'm seeing compared to the previous
> version.
> >
>
> Hmmm, interesting.  So just to be clear, you ran my patches without
> 'fsc' on the mount and it was fine, but with 'fsc' on the mount there
> were data corruptions in this re-export use case?  I've not done any
> tests with a re-export like that but off the top of my head I'm not
> sure why it would be a problem.  What NFS version(s) are you using?
>
>
> > I also totally accept that this is a very niche workload (and hard to
> reproduce)... I should have more details on it next week.
> >
>
> Ok - thanks again Daire!
>
>
>
> > Daire
> >
> > On Sat, Nov 21, 2020 at 1:50 PM David Wysochanski <dwysocha@redhat.com>
> wrote:
> >>
> >> I just posted patches to linux-nfs but neglected to CC this list.  For
> >> any interested in patches which convert NFS to use the new netfs and
> >> fscache APIs, please see the following series on linux-nfs:
> >> [PATCH v1 0/13] Convert NFS to new netfs and fscache APIs
> >> https://marc.info/?l=linux-nfs&m=160596540022461&w=2
> >>
> >> Thanks.
> >>
> >> --
> >> Linux-cachefs mailing list
> >> Linux-cachefs@redhat.com
> >> https://www.redhat.com/mailman/listinfo/linux-cachefs
> >>
>
>
--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://www.redhat.com/mailman/listinfo/linux-cachefs

