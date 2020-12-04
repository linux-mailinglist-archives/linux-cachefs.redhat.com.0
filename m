Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id 4B4B42CF5FC
	for <lists+linux-cachefs@lfdr.de>; Fri,  4 Dec 2020 22:08:58 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1607116137;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=F08TsV6MYYlmb+g9ICUbE9m9WngSZVcIgltYpK/dENU=;
	b=CGEwAid2LvmTMap7t5bTcgVSkyY/ELLvblSC4gKXuIbf3SvHAWj8PuF2sCGQW38tj2lWvv
	CCRP2fAx60rdSx53E2ujJK5P3HApMW+1Bcuv5UHrWdKlOIp/sbRoe6QwxYxGb8Miw8Sqgz
	ARF3Rc65dabO71YlOxXEXoXnVagWCVc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-532-8cmK3iq4MciNogsN7C-JGw-1; Fri, 04 Dec 2020 16:08:55 -0500
X-MC-Unique: 8cmK3iq4MciNogsN7C-JGw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 20313800FF0;
	Fri,  4 Dec 2020 21:08:53 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D2C3410023AC;
	Fri,  4 Dec 2020 21:08:52 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 6770B4E58E;
	Fri,  4 Dec 2020 21:08:52 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0B4L6Tg4005890 for <linux-cachefs@listman.util.phx.redhat.com>;
	Fri, 4 Dec 2020 16:06:29 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 805882166B2B; Fri,  4 Dec 2020 21:06:29 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7B29C2166B27
	for <linux-cachefs@redhat.com>; Fri,  4 Dec 2020 21:06:27 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 59C56811E86
	for <linux-cachefs@redhat.com>; Fri,  4 Dec 2020 21:06:27 +0000 (UTC)
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
	[209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-200-9fFLdGY4O626XKzGOugPnA-1; Fri, 04 Dec 2020 16:06:25 -0500
X-MC-Unique: 9fFLdGY4O626XKzGOugPnA-1
Received: by mail-ed1-f69.google.com with SMTP id i1so2832578edt.19
	for <linux-cachefs@redhat.com>; Fri, 04 Dec 2020 13:06:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=ydDACgKnEfhhGJJMrX+DsXRA3HlD/1J0NEBtWheHlsM=;
	b=PRMfV/vBnteDJo5min18xvf5YsuSxcq1ysJSRmmMEd1cKpTLwBKo7sXHN4D5EYIoWG
	f3vutQqyromRuWWo3EI9uVU0CbOixkCT/2f/JezVZHhMMz58vrcRmDMW2dY7vNvRLiSS
	RkmDkcNT6Mwjkf/VFD0dfndQTtTjWM/S7vwvTQo1nVBM8f+/BXTHumoYI5P+l8p1r05u
	eVOSuBYDlrvMIXkFwdTcKSClB/aT/XK4O1ZvVzXqJJk2jhOcv9OrU6HKxEGSsKueqEoo
	760JE8SnFaQWJmfZ3y+jopKhdFzQCImHss/vw9GD9bWVZF4QJqeZWf1TvDGDGQhU6F26
	DuLA==
X-Gm-Message-State: AOAM532u4BGDRNb+FI1qZkNWSS5ZmcoOxiHjGqfJaJhOef7rIOHWkYE+
	NfCjuQMHF7iq4R+YC1zJy1NvLa3mGHRwvfGHYu0cF1pL7mVUoBUHMjDyJxzAwNK3Hk40g6SnY7c
	I5wUAWZ0FWwhHRBDlHhOzYYfrXVv7AVZ1qDO+BA==
X-Received: by 2002:aa7:c749:: with SMTP id c9mr5359442eds.3.1607115984013;
	Fri, 04 Dec 2020 13:06:24 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwqB1SNf82fPFj6LIxfSCXcfxTUz0eoSmHZpZRmOZ2IXTtb/bFrIZWJa4eHrYaE3D7LMu4+e0T2IDUcZHYIzzA=
X-Received: by 2002:aa7:c749:: with SMTP id c9mr5359420eds.3.1607115983714;
	Fri, 04 Dec 2020 13:06:23 -0800 (PST)
MIME-Version: 1.0
References: <CALF+zOniUVE05=JnhHwqshq843rUH_Pm5gKewFL-oi3PFbLdMA@mail.gmail.com>
	<CAB3bAB8iJ2Gw6O=OmY_u-ucKXv_3VAy59Janx7JjJ682NWZjKg@mail.gmail.com>
	<CALF+zOkKOUL+Dr8ELk6sFLsOR3-AO0FqKnoZRmJqJx=WHRgxFw@mail.gmail.com>
	<CAB3bAB-eb6AFzo8v=C=kUMdsLr4YC_wGjufk2NYC32GaAd3O_w@mail.gmail.com>
	<CALF+zOkCvUCd6Zvd1SmL3kqArS3X1ny=e5FOef5o1oKcRmuwQw@mail.gmail.com>
	<CALF+zO=ka=pWFcYS2vDtc0vTJLsgGz+koc-=DCciZjDHc2s2tQ@mail.gmail.com>
	<CAB3bAB-T7C42AjBTP5gav=+w88i+1bHJwrWQrV5LyJWE735VrA@mail.gmail.com>
In-Reply-To: <CAB3bAB-T7C42AjBTP5gav=+w88i+1bHJwrWQrV5LyJWE735VrA@mail.gmail.com>
From: David Wysochanski <dwysocha@redhat.com>
Date: Fri, 4 Dec 2020 16:05:47 -0500
Message-ID: <CALF+zOnN59BFU+ANo9iv3-qFFGJdT3GH5MtTkBRe593RJe1O3A@mail.gmail.com>
To: Daire Byrne <daire.byrne@gmail.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 0B4L6Tg4005890
X-loop: linux-cachefs@redhat.com
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
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, Dec 4, 2020 at 3:56 PM Daire Byrne <daire.byrne@gmail.com> wrote:
>
> I didn't knowingly extend the files.... But I had been using some old files written months ago elsewhere.
>
> So I quickly tried with some new files... To avoid confusion and caching, I wrote them directly on the server to the local XFS filesystem that we are then exporting to client1 & client2. First thing I noticed is that there is a difference in behaviour depending on whether we write zeros or random data:
>
> server # dd if=/dev/zero of=/serverxfs/test.file.zero bs=1M count=512
> server # dd if=/dev/urandom of=/serverxfs/test.file.random bs=1M count=512
>
> client1 # md5sum /mnt/server/test-file.zero
> aa559b4e3523a6c931f08f4df52d58f2
> client1 # md5sum /mnt/server/test-file.random
> b8ea132924f105d5acc27787d57a9aa2
>
> client2 # for x in {1..10}; do (cat /mnt/server/test.file.zero > /dev/null &); done; wait
> client2 # md5sum /mnt/server/test.file.zero
> aa559b4e3523a6c931f08f4df52d58f2
>
> client2 # for x in {1..10}; do (cat /mnt/server/test.file.random > /dev/null &); done; wait
> client2 # md5sum /mnt/server/test.file.random
> e0334bd762800ab7447bfeab033e030d
>
> So the file full of zeros is okay but the random one is getting corrupted? I'm scratching my head a bit wondering if the XFS backing filesystem server and/or how the extents are laid out could in any way effect this but the NFS client shouldn't care right?
>
> With regards to the NFS server kernel it's 3.10.0-693.1.1.el7.x86_64 but if you mean your patched kernel, I just checked out your fscache-iter-nfs branch, made a git archive and then built an RPM out of it.... I must say there are a couple of nfs re-export patches (due for v5.11) that I have also applied on top.
>
I thought maybe the NFS server kernel mattered, but after I sent that
I thought more and realized that probably didn't make sense if it only
happens with fscache enabled.

> If you still can't reproduce, then I'll rip them out and test again.
>

I can reproduce it fairly reliably now but it's not 100%, though it's
good enough I made a unit test out of it.  Actually it does not seem
to need the extra write extend in some cases, this may just have
increased the likelihood of occurrence.  It reproduces more reliably
for me (at least right now) after a clean reboot.

To be honest I'm more than a bit surprised this snuck through and
didn't show up in any of xfstests, build tests, iozone or other unit
tests I've done. But it is what it is, and maybe if I would run some
tests in a loop it would show up there.

Thanks for the detailed bug report - I'll see if I can track it down now.


> Daire
>
>
> On Fri, Dec 4, 2020 at 7:36 PM David Wysochanski <dwysocha@redhat.com> wrote:
>>
>> On Fri, Dec 4, 2020 at 2:09 PM David Wysochanski <dwysocha@redhat.com> wrote:
>> >
>> > On Fri, Dec 4, 2020 at 1:03 PM Daire Byrne <daire.byrne@gmail.com> wrote:
>> > >
>> > > David,
>> > >
>> > > Okay, I spent a little more time on this today and I think we can forget about the re-export thing for a moment.
>> > >
>> > > I looked at what was happening and the issue seemed to be that once I had multiple clients of the re-export server (which has the iter fscache and fsc enabled mounts) all reading the same files at the same time (for the first time), then we often ended up with a missing sequential chunk of data from the cached file.
>> > >
>> > > The size and apparent size seemed to be the same as the original file on the server but md5sum and hexdump against the client mounted file showed otherwise.
>> > >
>> > > So then I tried to replicate this scenario in the simplest way using just a single (fscache-iter) client with an fsc enabled mountpoint using multiple processes to read the same uncached file for the first time (no NFS re-exporting).
>> > >
>> > > * client1 mounts the NFS server without fsc
>> > > * client2 mounts the NFS server with fsc (with fscache-iter).
>> > >
>> > > client1 # md5sum /mnt/server/file.1
>> > > 9ca99335b6f75a300dc22e45a776440c
>> > > client2 # cat /mnt/server/file.1
>> > > client2 # md5sum /mnt/server/file.1
>> > > 9ca99335b6f75a300dc22e45a776440c
>> > >
>> > > All good. The files was cached to disk and looks good. Now let's read the an uncached file using multiple processes simultaneously:
>> > >
>> > > client1 # md5sum /mnt/server/file.2
>> > > 9ca99335b6f75a300dc22e45a776440c
>> > > client2 # for x in {1..10}; do (cat /mnt/server/file.2 > /dev/null &); done; wait
>> > > client2 # md5sum /mnt/server/file.2
>> > > 26dd67fbf206f734df30fdec72d71429
>> > >
>> > > The file is now different/corrupt. So in my re-export case it's just that we have multiple knfsd processes reading in the same file simultaneously for the first time into cache. Then it remains corrupt and serves that out to multiple NFS clients.
>> > >
>> >
>> > Hmmm, yeah that for sure shouldn't happen!
>> >
>> >
>> > > In this case the backing filesystem was ext4 and the nfs client mount options were fsc,vers=4.2 (vers=3 is the same). The NFS server is running RHEL7.4.
>> > >
>> >
>> > How big is ' /mnt/server/file.2' and what is the NFS server kernel?
>> > Also can you give me the mount options from /proc/mounts on 'client2'?
>> > I'm not able to reproduce this yet but I'll keep trying.
>> >
>> >
>>
>> Ok I think I have a reproducer now, but it requires extending the file
>> size.  Did you re-write the file with a new size by any chance?
>> It doesn't reproduce for me on first go, but after extending the size
>> of the file it does.
>>
>> # mount -o vers=4.2,fsc 127.0.0.1:/export/dir1 /mnt/dir1
>> # dd if=/dev/urandom of=/export/dir1/file.bin bs=10M count=1
>> 1+0 records in
>> 1+0 records out
>> 10485760 bytes (10 MB, 10 MiB) copied, 0.216783 s, 48.4 MB/s
>> # for x in {1..10}; do (cat /mnt/dir1/file.bin > /dev/null &); done; wait
>> # md5sum /export/dir1/file.bin /mnt/dir1/file.bin
>> 94d2d0fe70f155211b5559bf7de27b34  /export/dir1/file.bin
>> 94d2d0fe70f155211b5559bf7de27b34  /mnt/dir1/file.bin
>> # dd if=/dev/urandom of=/export/dir1/file.bin bs=20M count=1
>> 1+0 records in
>> 1+0 records out
>> 20971520 bytes (21 MB, 20 MiB) copied, 0.453869 s, 46.2 MB/s
>> # for x in {1..10}; do (cat /mnt/dir1/file.bin > /dev/null &); done; wait
>> # md5sum /export/dir1/file.bin /mnt/dir1/file.bin
>> 32b9beb19b97655e9026c09bbe064dc8  /export/dir1/file.bin
>> f05fe078fe65b4e5c54afcd73c97686d  /mnt/dir1/file.bin
>> # uname -r
>> 5.10.0-rc4-94e9633d98a5+
>>
>>
>>
>> >
>> >
>> > > Daire
>> > >
>> > > On Thu, Dec 3, 2020 at 4:27 PM David Wysochanski <dwysocha@redhat.com> wrote:
>> > >>
>> > >> On Wed, Dec 2, 2020 at 12:01 PM Daire Byrne <daire.byrne@gmail.com> wrote:
>> > >> >
>> > >> > David,
>> > >> >
>> > >> > First off, thanks for the work on this - we look forward to this landing.
>> > >> >
>> > >>
>> > >> Yeah no problem - thank you for your interest and testing it!
>> > >>
>> > >> > I did some very quick tests of just the bandwidth using server class networking (40Gbit) and storage (NVMe).
>> > >> >
>> > >> > Comparing the old fscache with the new one, we saw a minimal degradation in reading back from the backing disk. But I am putting this more down the the more directio style of access in the new version.
>> > >> >
>> > >> > This can be seen when the cache is being written as we no longer use the writeback cache. I'm assuming something similar happens on reads so that we don't use readahead?
>> > >> >
>> > >>
>> > >> Without getting into it too much and just guessing, I'd guess either
>> > >> it's the usage of directIO or the limitation of the 1GB in cachefiles,
>> > >> but not sure.  We need to drill down of course into it because it
>> > >> could be a lot of things.
>> > >>
>> > >> > Anyway, the quick summary of performance using 10 threads of reads follows. I should mention that the NVMe has a physical limit of ~2,500MB/s writes & 5,000MB/s reads:
>> > >> >
>> > >> > iter fscache:
>> > >> > uncached first reads ~2,500MB/s (writing to nvme ext4/xfs)
>> > >> > cached subsequent reads ~4,200 (reading from nvme ext4)
>> > >> > cached subsequent reads ~3,500 (reading from nvme xfs)
>> > >> >
>> > >> > old fscache:
>> > >> > uncached first reads ~2,500MB/s (writing to nvme ext4/xfs)
>> > >> > cached subsequent reads ~5,000 (reading from nvme ext4)
>> > >> > xfs crashes a lot ...
>> > >> >
>> > >> > I have not done a thorough analysis of CPU usage or perf top differences yet.
>> > >> >
>> > >> > Then I went on to test our rather unique NFS re-export workload where we take this fscache backed server and re-export the fsc mounts to many clients. At this point something odd appeared to be happening. The clients were loading software from the fscache backed mounts but were often segfaulting at various points. This suggested that they were getting corrupted data or the memory mapping (binaries, libraries) was failing in some way. Perhaps some odd interaction between fscache and knfsd?
>> > >> >
>> > >> > I did a quick test of re-export without the fsc caching enabled on the server mounts (with the same 5.10-rc kernel) and I didn't get any errors. That's as far as I got before I got drawn away by other things. I hope to dig into it a little more next week. But I just thought I'd give some quick feedback of one potential difference I'm seeing compared to the previous version.
>> > >> >
>> > >>
>> > >> Hmmm, interesting.  So just to be clear, you ran my patches without
>> > >> 'fsc' on the mount and it was fine, but with 'fsc' on the mount there
>> > >> were data corruptions in this re-export use case?  I've not done any
>> > >> tests with a re-export like that but off the top of my head I'm not
>> > >> sure why it would be a problem.  What NFS version(s) are you using?
>> > >>
>> > >>
>> > >> > I also totally accept that this is a very niche workload (and hard to reproduce)... I should have more details on it next week.
>> > >> >
>> > >>
>> > >> Ok - thanks again Daire!
>> > >>
>> > >>
>> > >>
>> > >> > Daire
>> > >> >
>> > >> > On Sat, Nov 21, 2020 at 1:50 PM David Wysochanski <dwysocha@redhat.com> wrote:
>> > >> >>
>> > >> >> I just posted patches to linux-nfs but neglected to CC this list.  For
>> > >> >> any interested in patches which convert NFS to use the new netfs and
>> > >> >> fscache APIs, please see the following series on linux-nfs:
>> > >> >> [PATCH v1 0/13] Convert NFS to new netfs and fscache APIs
>> > >> >> https://marc.info/?l=linux-nfs&m=160596540022461&w=2
>> > >> >>
>> > >> >> Thanks.
>> > >> >>
>> > >> >> --
>> > >> >> Linux-cachefs mailing list
>> > >> >> Linux-cachefs@redhat.com
>> > >> >> https://www.redhat.com/mailman/listinfo/linux-cachefs
>> > >> >>
>> > >>
>>


--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://www.redhat.com/mailman/listinfo/linux-cachefs

