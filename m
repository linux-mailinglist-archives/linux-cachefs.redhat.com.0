Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 20C9E2CF48B
	for <lists+linux-cachefs@lfdr.de>; Fri,  4 Dec 2020 20:11:01 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1607109060;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=iDoB7V/JWJarE4AbsUgGQ+bdwR5+pMq3nQr5u4vmhtk=;
	b=ZIRa2Ku+XRnOKCB1ow6ctZ7dFWpAumXca8b4e1cFW6F9iZxhDlarhDFT/WcGiB4LEOK+W0
	RmYrCXQDbWcOR92UcEB46cr/PDgJvKJG4yM3eR4Bi0H7pebTRGzGlhPBVbISq009OhJ1sK
	+sFYXW4LtTc9AuPAEumMah2I69xdeqU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-515-vAeqGhROMYO3rULhuc430w-1; Fri, 04 Dec 2020 14:10:58 -0500
X-MC-Unique: vAeqGhROMYO3rULhuc430w-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 52D6F858183;
	Fri,  4 Dec 2020 19:10:56 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5DF665C1D1;
	Fri,  4 Dec 2020 19:10:54 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 40F2B4BB7B;
	Fri,  4 Dec 2020 19:10:49 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0B4JAiWo026535 for <linux-cachefs@listman.util.phx.redhat.com>;
	Fri, 4 Dec 2020 14:10:44 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 0871510848A; Fri,  4 Dec 2020 19:10:44 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 024E5108486
	for <linux-cachefs@redhat.com>; Fri,  4 Dec 2020 19:10:40 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 487C4803DCD
	for <linux-cachefs@redhat.com>; Fri,  4 Dec 2020 19:10:40 +0000 (UTC)
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
	[209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-228-DdtSbbLkMJGOZpqZboER1A-1; Fri, 04 Dec 2020 14:10:38 -0500
X-MC-Unique: DdtSbbLkMJGOZpqZboER1A-1
Received: by mail-ed1-f72.google.com with SMTP id ca7so2741624edb.12
	for <linux-cachefs@redhat.com>; Fri, 04 Dec 2020 11:10:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=H58lrW8lfeSDe+vvkpxSqmu+4eUXrOoFri6i9vGzNzE=;
	b=c+/mG81SbA/1s8ohE9760b6vJs7v8QUm4ORlWOb+pfBfIW9qCTwKFYqhtoK3DS6VqV
	s/FfbG2J34cYm+2BjG1Pe3q7Hmaj6vVVYfLZCZIn+nSKwdLpy5qNIcoQ6cENwLMUk9Dn
	fKkcPdhJqVV0m1sb0Tn3AehZzCvcwn/5NfFH/T06nknGhgYzfDgPa5MpUGb5+kF8ZSaM
	fBCqIRIDOHPFA5B/r7Py73cDC9GSvJmvk4/k0msVvHtB3XC3rqa4LF7RljS+qKhZNm1M
	GzBFXTvPdPUMfupj8f1WSqtA52hF304as94uHNFQxg5lbQGwJWJH53sYXJAAaeYLvCAH
	3NHQ==
X-Gm-Message-State: AOAM532e0JvH8seP5pHFmoGoy2NkB6X8Gc8hXH4Ya0Wv1dwrhnJNF86b
	uoAjaD03SJK2K10bw+mwqmYKVObcKRhT+svNtt3b6ZVYLBEw/3TUg0ZEgSSj0Yr3vXPRM+Su+11
	DLnyNjPr0ONakpDp8VyZqGRk16QzFhpK5FMTqLQ==
X-Received: by 2002:a17:906:17d1:: with SMTP id
	u17mr8753144eje.229.1607109036006; 
	Fri, 04 Dec 2020 11:10:36 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyHfm5InzjzeC/A8bPyVORmtqc9D8dDluO7m2zjrLvjDvyuD10CtyDpYSLq/ZMXg9eX3piFVHc/8g0ECU6GDL0=
X-Received: by 2002:a17:906:17d1:: with SMTP id
	u17mr8753128eje.229.1607109035774; 
	Fri, 04 Dec 2020 11:10:35 -0800 (PST)
MIME-Version: 1.0
References: <CALF+zOniUVE05=JnhHwqshq843rUH_Pm5gKewFL-oi3PFbLdMA@mail.gmail.com>
	<CAB3bAB8iJ2Gw6O=OmY_u-ucKXv_3VAy59Janx7JjJ682NWZjKg@mail.gmail.com>
	<CALF+zOkKOUL+Dr8ELk6sFLsOR3-AO0FqKnoZRmJqJx=WHRgxFw@mail.gmail.com>
	<CAB3bAB-eb6AFzo8v=C=kUMdsLr4YC_wGjufk2NYC32GaAd3O_w@mail.gmail.com>
In-Reply-To: <CAB3bAB-eb6AFzo8v=C=kUMdsLr4YC_wGjufk2NYC32GaAd3O_w@mail.gmail.com>
From: David Wysochanski <dwysocha@redhat.com>
Date: Fri, 4 Dec 2020 14:09:59 -0500
Message-ID: <CALF+zOkCvUCd6Zvd1SmL3kqArS3X1ny=e5FOef5o1oKcRmuwQw@mail.gmail.com>
To: Daire Byrne <daire.byrne@gmail.com>
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 0B4JAiWo026535
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, Dec 4, 2020 at 1:03 PM Daire Byrne <daire.byrne@gmail.com> wrote:
>
> David,
>
> Okay, I spent a little more time on this today and I think we can forget about the re-export thing for a moment.
>
> I looked at what was happening and the issue seemed to be that once I had multiple clients of the re-export server (which has the iter fscache and fsc enabled mounts) all reading the same files at the same time (for the first time), then we often ended up with a missing sequential chunk of data from the cached file.
>
> The size and apparent size seemed to be the same as the original file on the server but md5sum and hexdump against the client mounted file showed otherwise.
>
> So then I tried to replicate this scenario in the simplest way using just a single (fscache-iter) client with an fsc enabled mountpoint using multiple processes to read the same uncached file for the first time (no NFS re-exporting).
>
> * client1 mounts the NFS server without fsc
> * client2 mounts the NFS server with fsc (with fscache-iter).
>
> client1 # md5sum /mnt/server/file.1
> 9ca99335b6f75a300dc22e45a776440c
> client2 # cat /mnt/server/file.1
> client2 # md5sum /mnt/server/file.1
> 9ca99335b6f75a300dc22e45a776440c
>
> All good. The files was cached to disk and looks good. Now let's read the an uncached file using multiple processes simultaneously:
>
> client1 # md5sum /mnt/server/file.2
> 9ca99335b6f75a300dc22e45a776440c
> client2 # for x in {1..10}; do (cat /mnt/server/file.2 > /dev/null &); done; wait
> client2 # md5sum /mnt/server/file.2
> 26dd67fbf206f734df30fdec72d71429
>
> The file is now different/corrupt. So in my re-export case it's just that we have multiple knfsd processes reading in the same file simultaneously for the first time into cache. Then it remains corrupt and serves that out to multiple NFS clients.
>

Hmmm, yeah that for sure shouldn't happen!


> In this case the backing filesystem was ext4 and the nfs client mount options were fsc,vers=4.2 (vers=3 is the same). The NFS server is running RHEL7.4.
>

How big is ' /mnt/server/file.2' and what is the NFS server kernel?
Also can you give me the mount options from /proc/mounts on 'client2'?
I'm not able to reproduce this yet but I'll keep trying.




> Daire
>
> On Thu, Dec 3, 2020 at 4:27 PM David Wysochanski <dwysocha@redhat.com> wrote:
>>
>> On Wed, Dec 2, 2020 at 12:01 PM Daire Byrne <daire.byrne@gmail.com> wrote:
>> >
>> > David,
>> >
>> > First off, thanks for the work on this - we look forward to this landing.
>> >
>>
>> Yeah no problem - thank you for your interest and testing it!
>>
>> > I did some very quick tests of just the bandwidth using server class networking (40Gbit) and storage (NVMe).
>> >
>> > Comparing the old fscache with the new one, we saw a minimal degradation in reading back from the backing disk. But I am putting this more down the the more directio style of access in the new version.
>> >
>> > This can be seen when the cache is being written as we no longer use the writeback cache. I'm assuming something similar happens on reads so that we don't use readahead?
>> >
>>
>> Without getting into it too much and just guessing, I'd guess either
>> it's the usage of directIO or the limitation of the 1GB in cachefiles,
>> but not sure.  We need to drill down of course into it because it
>> could be a lot of things.
>>
>> > Anyway, the quick summary of performance using 10 threads of reads follows. I should mention that the NVMe has a physical limit of ~2,500MB/s writes & 5,000MB/s reads:
>> >
>> > iter fscache:
>> > uncached first reads ~2,500MB/s (writing to nvme ext4/xfs)
>> > cached subsequent reads ~4,200 (reading from nvme ext4)
>> > cached subsequent reads ~3,500 (reading from nvme xfs)
>> >
>> > old fscache:
>> > uncached first reads ~2,500MB/s (writing to nvme ext4/xfs)
>> > cached subsequent reads ~5,000 (reading from nvme ext4)
>> > xfs crashes a lot ...
>> >
>> > I have not done a thorough analysis of CPU usage or perf top differences yet.
>> >
>> > Then I went on to test our rather unique NFS re-export workload where we take this fscache backed server and re-export the fsc mounts to many clients. At this point something odd appeared to be happening. The clients were loading software from the fscache backed mounts but were often segfaulting at various points. This suggested that they were getting corrupted data or the memory mapping (binaries, libraries) was failing in some way. Perhaps some odd interaction between fscache and knfsd?
>> >
>> > I did a quick test of re-export without the fsc caching enabled on the server mounts (with the same 5.10-rc kernel) and I didn't get any errors. That's as far as I got before I got drawn away by other things. I hope to dig into it a little more next week. But I just thought I'd give some quick feedback of one potential difference I'm seeing compared to the previous version.
>> >
>>
>> Hmmm, interesting.  So just to be clear, you ran my patches without
>> 'fsc' on the mount and it was fine, but with 'fsc' on the mount there
>> were data corruptions in this re-export use case?  I've not done any
>> tests with a re-export like that but off the top of my head I'm not
>> sure why it would be a problem.  What NFS version(s) are you using?
>>
>>
>> > I also totally accept that this is a very niche workload (and hard to reproduce)... I should have more details on it next week.
>> >
>>
>> Ok - thanks again Daire!
>>
>>
>>
>> > Daire
>> >
>> > On Sat, Nov 21, 2020 at 1:50 PM David Wysochanski <dwysocha@redhat.com> wrote:
>> >>
>> >> I just posted patches to linux-nfs but neglected to CC this list.  For
>> >> any interested in patches which convert NFS to use the new netfs and
>> >> fscache APIs, please see the following series on linux-nfs:
>> >> [PATCH v1 0/13] Convert NFS to new netfs and fscache APIs
>> >> https://marc.info/?l=linux-nfs&m=160596540022461&w=2
>> >>
>> >> Thanks.
>> >>
>> >> --
>> >> Linux-cachefs mailing list
>> >> Linux-cachefs@redhat.com
>> >> https://www.redhat.com/mailman/listinfo/linux-cachefs
>> >>
>>


--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://www.redhat.com/mailman/listinfo/linux-cachefs

