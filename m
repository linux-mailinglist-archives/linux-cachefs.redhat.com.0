Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id EAB463901F9
	for <lists+linux-cachefs@lfdr.de>; Tue, 25 May 2021 15:17:25 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-107-IK0_N8lNMnm_NrFuSekIEQ-1; Tue, 25 May 2021 09:17:22 -0400
X-MC-Unique: IK0_N8lNMnm_NrFuSekIEQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1B2261922961;
	Tue, 25 May 2021 13:17:20 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D71BE18B39;
	Tue, 25 May 2021 13:17:19 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id BDD1C180B464;
	Tue, 25 May 2021 13:17:18 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 14JEDgcd012392 for <linux-cachefs@listman.util.phx.redhat.com>;
	Wed, 19 May 2021 10:13:42 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 727A22076359; Wed, 19 May 2021 14:13:42 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6DA4D2076358
	for <linux-cachefs@redhat.com>; Wed, 19 May 2021 14:13:39 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5B6BC80D0E3
	for <linux-cachefs@redhat.com>; Wed, 19 May 2021 14:13:39 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com
	[209.85.128.51]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-479-M01HFPQYMOSFZTQREnEgOA-1; Wed, 19 May 2021 10:13:29 -0400
X-MC-Unique: M01HFPQYMOSFZTQREnEgOA-1
Received: by mail-wm1-f51.google.com with SMTP id
	h3-20020a05600c3503b0290176f13c7715so3417466wmq.5
	for <linux-cachefs@redhat.com>; Wed, 19 May 2021 07:13:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:organization
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-transfer-encoding:content-language;
	bh=F1uHj1sY3bif8fDQ1vUSxLLQOsCnGsqmIKuxItWP5SE=;
	b=Mgf63QPMCwcJbgKKgwWasIRpZUTTFsY/LwsiRNwdFpCz/uIk/FvmCquI5dUvuo0MwR
	Esn5XIiHJqJQN+61uMQZiqW896VEpU4mA7HlBQ4CDjP1YSYbkZz9BIh1WgToZfUmwYd5
	gfMotAJpAChpaWuy2FMvux79OtKnk01ScWr2Pfx4TywbHf20JctXRl4wkvxEVISpknL2
	e2LzrCXxAKX2cjFiE7zOKLkrBYuctoY6KTqMwg/O9vYlFlj++tamOaZa3eCtVibWkqxa
	/ezRUAWFwJrB68iU8aNfTJIktCWjTRquzmZ2u9m/F9gCPrft/dO69yyu4ciNX8s6LS+y
	oq4g==
X-Gm-Message-State: AOAM531KFPDS/jK2zH98HJ7Zp2osQYFMsZDPSq0NzEm1gEM81fU/UWev
	XCx8pf3UYfkNc4i63U8o2H38Aw==
X-Google-Smtp-Source: ABdhPJxk+UI+VUW6asY9NMngA528APjLs2XsUer7iCT6Z9lvFyaeGL+Kw3GXszS2nh/Snl9Wx61CBA==
X-Received: by 2002:a05:600c:19cc:: with SMTP id
	u12mr7608624wmq.178.1621433607809; 
	Wed, 19 May 2021 07:13:27 -0700 (PDT)
Received: from avi.scylladb.com (system.cloudius-systems.com. [199.203.229.89])
	by smtp.gmail.com with ESMTPSA id
	h9sm20842196wmb.35.2021.05.19.07.13.26
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Wed, 19 May 2021 07:13:27 -0700 (PDT)
To: Dave Chinner <david@fromorbit.com>
References: <206078.1621264018@warthog.procyon.org.uk>
	<20210517232237.GE2893@dread.disaster.area>
	<ad2e8757-41ce-41e3-a22e-0cf9e356e656@scylladb.com>
	<20210519125743.GP2893@dread.disaster.area>
From: Avi Kivity <avi@scylladb.com>
Organization: ScyllaDB
Message-ID: <c5d83b86-321e-349b-303c-b6027bcd9ae1@scylladb.com>
Date: Wed, 19 May 2021 17:13:25 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
	Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210519125743.GP2893@dread.disaster.area>
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
X-Mailman-Approved-At: Tue, 25 May 2021 09:17:16 -0400
Cc: linux-xfs@vger.kernel.org, Theodore Ts'o <tytso@mit.edu>,
	"Darrick J. Wong" <djwong@kernel.org>, Chris Mason <clm@fb.com>,
	linux-cachefs@redhat.com, Andreas Dilger <adilger.kernel@dilger.ca>,
	linux-fsdevel@vger.kernel.org, linux-ext4@vger.kernel.org,
	linux-btrfs@vger.kernel.org
Subject: Re: [Linux-cachefs] How capacious and well-indexed are ext4,
 xfs and btrfs directories?
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
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=linux-cachefs-bounces@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"


On 19/05/2021 15.57, Dave Chinner wrote:
> On Wed, May 19, 2021 at 11:00:03AM +0300, Avi Kivity wrote:
>> On 18/05/2021 02.22, Dave Chinner wrote:
>>>> What I'd like to do is remove the fanout directories, so that for each logical
>>>> "volume"[*] I have a single directory with all the files in it.  But that
>>>> means sticking massive amounts of entries into a single directory and hoping
>>>> it (a) isn't too slow and (b) doesn't hit the capacity limit.
>>> Note that if you use a single directory, you are effectively single
>>> threading modifications to your file index. You still need to use
>>> fanout directories if you want concurrency during modification for
>>> the cachefiles index, but that's a different design criteria
>>> compared to directory capacity and modification/lookup scalability.
>> Something that hit us with single-large-directory and XFS is that
>> XFS will allocate all files in a directory using the same
>> allocation group.  If your entire filesystem is just for that one
>> directory, then that allocation group will be contended.
> There is more than one concurrency problem that can arise from using
> single large directories. Allocation policy is just another aspect
> of the concurrency picture.
>
> Indeed, you can avoid this specific problem simply by using the
> inode32 allocator - this policy round-robins files across allocation
> groups instead of trying to keep files physically local to their
> parent directory. Hence if you just want one big directory with lots
> of files that index lots of data, using the inode32 allocator will
> allow the files in the filesytsem to allocate/free space at maximum
> concurrency at all times...


Perhaps a directory attribute can be useful in case the filesystem is 
created independently of the application (say by the OS installer).


>
>> We saw spurious ENOSPC when that happened, though that
>> may have related to bad O_DIRECT management by us.
> You should not see spurious ENOSPC at all.
>
> The only time I've recall this sort of thing occurring is when large
> extent size hints are abused by applying them to every single file
> and allocation regardless of whether they are needed, whilst
> simultaneously mixing long term and short term data in the same
> physical locality.


Yes, you remember well.


>   Over time the repeated removal and reallocation
> of short term data amongst long term data fragments the crap out of
> free space until there are no large contiguous free spaces left to
> allocate contiguous extents from.
>
>> We ended up creating files in a temporary directory and moving them to the
>> main directory, since for us the directory layout was mandated by
>> compatibility concerns.
> inode32 would have done effectively the same thing but without
> needing to change the application....


It would not have helped the installed base.


>> We are now happy with XFS large-directory management, but are nowhere close
>> to a million files.
> I think you are conflating directory scalability with problems
> arising from file allocation policies not being ideal for your data
> set organisation, layout and longevity characteristics.


Probably, but these problems can happen to others using large 
directories. The XFS list can be very helpful in resolving them, but 
better to be warned ahead.


--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

