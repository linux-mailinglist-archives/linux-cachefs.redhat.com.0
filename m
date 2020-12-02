Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id F23D02CC2ED
	for <lists+linux-cachefs@lfdr.de>; Wed,  2 Dec 2020 18:01:48 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-461-LAiE-0JrPX2bMqufAmt_aQ-1; Wed, 02 Dec 2020 12:01:46 -0500
X-MC-Unique: LAiE-0JrPX2bMqufAmt_aQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3FEAA9CC0D;
	Wed,  2 Dec 2020 17:01:42 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id F2FDB5D6AC;
	Wed,  2 Dec 2020 17:01:40 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id B8C3B5002C;
	Wed,  2 Dec 2020 17:01:37 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 0B2H1ZnR012913 for <linux-cachefs@listman.util.phx.redhat.com>;
	Wed, 2 Dec 2020 12:01:35 -0500
Received: by smtp.corp.redhat.com (Postfix)
	id 465FA2026D47; Wed,  2 Dec 2020 17:01:35 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 412942026D12
	for <linux-cachefs@redhat.com>; Wed,  2 Dec 2020 17:01:29 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0654F803DCD
	for <linux-cachefs@redhat.com>; Wed,  2 Dec 2020 17:01:29 +0000 (UTC)
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com
	[209.85.216.49]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-403-ST4LHmqnPPq9ipkg00ZDsA-1; Wed, 02 Dec 2020 12:01:21 -0500
X-MC-Unique: ST4LHmqnPPq9ipkg00ZDsA-1
Received: by mail-pj1-f49.google.com with SMTP id v1so1357560pjr.2;
	Wed, 02 Dec 2020 09:01:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=PcvuvycWm09hds+xTKSsRlPlclYK+29iJZZegnM2+e4=;
	b=Z9f0uK2NziNaJRD34UP9QGJP4q2ExbBkROBeVU5tGoUxXgqDfu3vssNFXotYfeNUkl
	rA0MZBX+pFVd9fGRpEzY0z1NnNvVwFLt1Ch1y6qehPeeF8yXqGsMU2+XkSa5v/HIUUTX
	ED3HQMyWYdWPeyFmNdJxi86wwom0kWubZAxehDgmy1ht9Ouic1I9XbVyZMSdOxV/Mb7Q
	vCXC1sUVsfOnizDTvXFm7cb3iq6YkOZp/kUhshpBgNY9OzcV8EZWwn0PtWRWuHn2QYEY
	B3ODdKXG18lZ3EIWu3Dp/dH2dN4I6uamK21QMd2uTAMyWTeCokIYgTdG35JR1ikITeqI
	deXQ==
X-Gm-Message-State: AOAM530u8U/oqQwPLI7FlNmtD6zVPKslKB92kICCUz7gPx7v6VVl06Kz
	bpHxjyX1Ns5JGhI7xVND1DiXExevl6t2PaWUyAOGX9Xt3iM=
X-Google-Smtp-Source: ABdhPJw5fhJ03ski86P6yz22sdiFJAdXc/5rUQD02WSLOW/0TA7ajMgs+S1yfD0yBsdP9ytgrWPgFF+QrWFwsAteW20=
X-Received: by 2002:a17:90a:5d93:: with SMTP id
	t19mr741180pji.220.1606928480258; 
	Wed, 02 Dec 2020 09:01:20 -0800 (PST)
MIME-Version: 1.0
References: <CALF+zOniUVE05=JnhHwqshq843rUH_Pm5gKewFL-oi3PFbLdMA@mail.gmail.com>
In-Reply-To: <CALF+zOniUVE05=JnhHwqshq843rUH_Pm5gKewFL-oi3PFbLdMA@mail.gmail.com>
From: Daire Byrne <daire.byrne@gmail.com>
Date: Wed, 2 Dec 2020 17:01:09 +0000
Message-ID: <CAB3bAB8iJ2Gw6O=OmY_u-ucKXv_3VAy59Janx7JjJ682NWZjKg@mail.gmail.com>
To: David Wysochanski <dwysocha@redhat.com>
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

David,

First off, thanks for the work on this - we look forward to this landing.

I did some very quick tests of just the bandwidth using server class
networking (40Gbit) and storage (NVMe).

Comparing the old fscache with the new one, we saw a minimal degradation in
reading back from the backing disk. But I am putting this more down the the
more directio style of access in the new version.

This can be seen when the cache is being written as we no longer use the
writeback cache. I'm assuming something similar happens on reads so that we
don't use readahead?

Anyway, the quick summary of performance using 10 threads of reads follows.
I should mention that the NVMe has a physical limit of ~2,500MB/s writes &
5,000MB/s reads:

iter fscache:
uncached first reads ~2,500MB/s (writing to nvme ext4/xfs)
cached subsequent reads ~4,200 (reading from nvme ext4)
cached subsequent reads ~3,500 (reading from nvme xfs)

old fscache:
uncached first reads ~2,500MB/s (writing to nvme ext4/xfs)
cached subsequent reads ~5,000 (reading from nvme ext4)
xfs crashes a lot ...

I have not done a thorough analysis of CPU usage or perf top differences
yet.

Then I went on to test our rather unique NFS re-export workload where we
take this fscache backed server and re-export the fsc mounts to many
clients. At this point something odd appeared to be happening. The clients
were loading software from the fscache backed mounts but were often
segfaulting at various points. This suggested that they were getting
corrupted data or the memory mapping (binaries, libraries) was failing in
some way. Perhaps some odd interaction between fscache and knfsd?

I did a quick test of re-export without the fsc caching enabled on the
server mounts (with the same 5.10-rc kernel) and I didn't get any errors.
That's as far as I got before I got drawn away by other things. I hope to
dig into it a little more next week. But I just thought I'd give some quick
feedback of one potential difference I'm seeing compared to the previous
version.

I also totally accept that this is a very niche workload (and hard to
reproduce)... I should have more details on it next week.

Daire

On Sat, Nov 21, 2020 at 1:50 PM David Wysochanski <dwysocha@redhat.com>
wrote:

> I just posted patches to linux-nfs but neglected to CC this list.  For
> any interested in patches which convert NFS to use the new netfs and
> fscache APIs, please see the following series on linux-nfs:
> [PATCH v1 0/13] Convert NFS to new netfs and fscache APIs
> https://marc.info/?l=linux-nfs&m=160596540022461&w=2
>
> Thanks.
>
> --
> Linux-cachefs mailing list
> Linux-cachefs@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-cachefs
>
>
--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://www.redhat.com/mailman/listinfo/linux-cachefs

