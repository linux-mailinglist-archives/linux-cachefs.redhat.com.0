Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	by mail.lfdr.de (Postfix) with ESMTP id B9FEC2CDB2F
	for <lists+linux-cachefs@lfdr.de>; Thu,  3 Dec 2020 17:27:41 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1607012860;
	h=from:from:sender:sender:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:list-id:list-help:
	 list-unsubscribe:list-subscribe:list-post;
	bh=CzT4S9bHw5tywGEQr1R12CcdnKba0P450uKEjXRpRf4=;
	b=Ipd5Uy5uEgOZrZX5yMYharmgSJq///pZmyiWUX4/ni2MRirB/JXYrQwVasFWwFbvSeNyCV
	imy8TJwOlCcYlYC2fJlKbmeu8IuWuWP5vOrGJzFx21DRN7KVwZrXKl8FApxx/0yVtJ7Wwz
	kcOqpz6qU63uKyCuWbAmRfpFOlHbfzA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-524-m3sqL0TDNJqKWFYcUUsPhQ-1; Thu, 03 Dec 2020 11:27:38 -0500
X-MC-Unique: m3sqL0TDNJqKWFYcUUsPhQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4F2F91083EB0;
	Thu,  3 Dec 2020 16:27:36 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id EC0A660C15;
	Thu,  3 Dec 2020 16:27:35 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id 84980180954D;
	Thu,  3 Dec 2020 16:27:35 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0B3GRXDR031018 for <linux-cachefs@listman.util.phx.redhat.com>;
	Thu, 3 Dec 2020 11:27:33 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id EDCAA102F124; Thu,  3 Dec 2020 16:27:32 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E91CE115D37E
	for <linux-cachefs@redhat.com>; Thu,  3 Dec 2020 16:27:30 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A379F811E86
	for <linux-cachefs@redhat.com>; Thu,  3 Dec 2020 16:27:30 +0000 (UTC)
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
	[209.85.218.70]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-207-GKcr8fdCNzuuudUIDuPuBw-1; Thu, 03 Dec 2020 11:27:28 -0500
X-MC-Unique: GKcr8fdCNzuuudUIDuPuBw-1
Received: by mail-ej1-f70.google.com with SMTP id q11so985204ejd.0
	for <linux-cachefs@redhat.com>; Thu, 03 Dec 2020 08:27:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=GzMhXRMkfQgO4V9GHOANmymrNHJFDcr0Jd0uGpljObU=;
	b=FZm8S2y7mwc/c5WSKyytdRI39OndZFxPgLnqQL3gHPGvZkhvmfwkHlCiWOUGIgRJxd
	VUUq38ISpQbifBnR0YoZgUE0jrk4q00Tz9ppwsYfFQkHW7rds+DidUbmjObpePu2WfUf
	EUQMGjoeODnGVQwzHLJYiniTD8jjg8vLEIaJ2QHzAUgYPZuhyCkrobCuDC7lKnPP0z2F
	oWR69mHB679MfgCxjCWaQMVx1FQ3gNmfeynqDzCmEmj/XOXmO3/MJ3ROhkN7QgKewb++
	T8a7rWa1VKtTI+AXdceYdpNN9IKRzkc3ocVjxAXSdJmHjlIps8fE3PrHXjIz8P0FMH2M
	2TZQ==
X-Gm-Message-State: AOAM5325QmM+EtvXSIJz31ZXG4KviD/EMKqHH6CjYoHWKc7cMzcc3aw7
	i3B2AIdurKj/pKINFBxBsGCnoZcwoOqxHIJLAD9h8Uif3KjxRaseRGrA9IM9xUX2flNSuObdr8i
	tRQtS12WL5Gu65Lihy7+MMRjOHg++1dUJEbrZOQ==
X-Received: by 2002:a17:906:6dc3:: with SMTP id
	j3mr3442759ejt.320.1607012847391; 
	Thu, 03 Dec 2020 08:27:27 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzB9/81h5VDN3pnNUnuBmvfvhdT1ZJZ8SmBdGixWHI2ACRIVUqtWOj5/T/wEvkDGTFU6xdAWHL/RdB+zuAXAfY=
X-Received: by 2002:a17:906:6dc3:: with SMTP id
	j3mr3442741ejt.320.1607012847180; 
	Thu, 03 Dec 2020 08:27:27 -0800 (PST)
MIME-Version: 1.0
References: <CALF+zOniUVE05=JnhHwqshq843rUH_Pm5gKewFL-oi3PFbLdMA@mail.gmail.com>
	<CAB3bAB8iJ2Gw6O=OmY_u-ucKXv_3VAy59Janx7JjJ682NWZjKg@mail.gmail.com>
In-Reply-To: <CAB3bAB8iJ2Gw6O=OmY_u-ucKXv_3VAy59Janx7JjJ682NWZjKg@mail.gmail.com>
From: David Wysochanski <dwysocha@redhat.com>
Date: Thu, 3 Dec 2020 11:26:51 -0500
Message-ID: <CALF+zOkKOUL+Dr8ELk6sFLsOR3-AO0FqKnoZRmJqJx=WHRgxFw@mail.gmail.com>
To: Daire Byrne <daire.byrne@gmail.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-MIME-Autoconverted: from quoted-printable to 8bit by
	lists01.pubmisc.prod.ext.phx2.redhat.com id 0B3GRXDR031018
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, Dec 2, 2020 at 12:01 PM Daire Byrne <daire.byrne@gmail.com> wrote:
>
> David,
>
> First off, thanks for the work on this - we look forward to this landing.
>

Yeah no problem - thank you for your interest and testing it!

> I did some very quick tests of just the bandwidth using server class networking (40Gbit) and storage (NVMe).
>
> Comparing the old fscache with the new one, we saw a minimal degradation in reading back from the backing disk. But I am putting this more down the the more directio style of access in the new version.
>
> This can be seen when the cache is being written as we no longer use the writeback cache. I'm assuming something similar happens on reads so that we don't use readahead?
>

Without getting into it too much and just guessing, I'd guess either
it's the usage of directIO or the limitation of the 1GB in cachefiles,
but not sure.  We need to drill down of course into it because it
could be a lot of things.

> Anyway, the quick summary of performance using 10 threads of reads follows. I should mention that the NVMe has a physical limit of ~2,500MB/s writes & 5,000MB/s reads:
>
> iter fscache:
> uncached first reads ~2,500MB/s (writing to nvme ext4/xfs)
> cached subsequent reads ~4,200 (reading from nvme ext4)
> cached subsequent reads ~3,500 (reading from nvme xfs)
>
> old fscache:
> uncached first reads ~2,500MB/s (writing to nvme ext4/xfs)
> cached subsequent reads ~5,000 (reading from nvme ext4)
> xfs crashes a lot ...
>
> I have not done a thorough analysis of CPU usage or perf top differences yet.
>
> Then I went on to test our rather unique NFS re-export workload where we take this fscache backed server and re-export the fsc mounts to many clients. At this point something odd appeared to be happening. The clients were loading software from the fscache backed mounts but were often segfaulting at various points. This suggested that they were getting corrupted data or the memory mapping (binaries, libraries) was failing in some way. Perhaps some odd interaction between fscache and knfsd?
>
> I did a quick test of re-export without the fsc caching enabled on the server mounts (with the same 5.10-rc kernel) and I didn't get any errors. That's as far as I got before I got drawn away by other things. I hope to dig into it a little more next week. But I just thought I'd give some quick feedback of one potential difference I'm seeing compared to the previous version.
>

Hmmm, interesting.  So just to be clear, you ran my patches without
'fsc' on the mount and it was fine, but with 'fsc' on the mount there
were data corruptions in this re-export use case?  I've not done any
tests with a re-export like that but off the top of my head I'm not
sure why it would be a problem.  What NFS version(s) are you using?


> I also totally accept that this is a very niche workload (and hard to reproduce)... I should have more details on it next week.
>

Ok - thanks again Daire!



> Daire
>
> On Sat, Nov 21, 2020 at 1:50 PM David Wysochanski <dwysocha@redhat.com> wrote:
>>
>> I just posted patches to linux-nfs but neglected to CC this list.  For
>> any interested in patches which convert NFS to use the new netfs and
>> fscache APIs, please see the following series on linux-nfs:
>> [PATCH v1 0/13] Convert NFS to new netfs and fscache APIs
>> https://marc.info/?l=linux-nfs&m=160596540022461&w=2
>>
>> Thanks.
>>
>> --
>> Linux-cachefs mailing list
>> Linux-cachefs@redhat.com
>> https://www.redhat.com/mailman/listinfo/linux-cachefs
>>


--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://www.redhat.com/mailman/listinfo/linux-cachefs

