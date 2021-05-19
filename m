Return-Path: <linux-cachefs-bounces@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	by mail.lfdr.de (Postfix) with ESMTP id 589983901F8
	for <lists+linux-cachefs@lfdr.de>; Tue, 25 May 2021 15:17:25 +0200 (CEST)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-207-ixkMuNyBPc6F_er82ik-pw-1; Tue, 25 May 2021 09:17:22 -0400
X-MC-Unique: ixkMuNyBPc6F_er82ik-pw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E63008005AD;
	Tue, 25 May 2021 13:17:19 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D764861169;
	Tue, 25 May 2021 13:17:19 +0000 (UTC)
Received: from lists01.pubmisc.prod.ext.phx2.redhat.com (lists01.pubmisc.prod.ext.phx2.redhat.com [10.5.19.33])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id B5E6B1801029;
	Tue, 25 May 2021 13:17:18 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	by lists01.pubmisc.prod.ext.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id 14J80CnS024743 for <linux-cachefs@listman.util.phx.redhat.com>;
	Wed, 19 May 2021 04:00:12 -0400
Received: by smtp.corp.redhat.com (Postfix)
	id 3BB1321EE560; Wed, 19 May 2021 08:00:12 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 34FA821EE562
	for <linux-cachefs@redhat.com>; Wed, 19 May 2021 08:00:10 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E1267833A01
	for <linux-cachefs@redhat.com>; Wed, 19 May 2021 08:00:09 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com
	[209.85.128.45]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-600-EnO3QGwMP9-bXL02zwMEaA-1; Wed, 19 May 2021 04:00:06 -0400
X-MC-Unique: EnO3QGwMP9-bXL02zwMEaA-1
Received: by mail-wm1-f45.google.com with SMTP id
	u4-20020a05600c00c4b02901774b80945cso2865346wmm.3
	for <linux-cachefs@redhat.com>; Wed, 19 May 2021 01:00:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:organization
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-transfer-encoding:content-language;
	bh=LQxYHlpQlKzbVy7Qs+DZ8b8cOO6vCYLqnE0OUJbqO1U=;
	b=NXsxn+fKIahxZ1LaDGB1Oh7koNZvVfiFAYq+mklxn7XV/+u6Y+j8xWkXEMrUHtM9pZ
	pgsOAHAoe/RT/2xPtq7RpIAN8ZmFHQ+TNDon/T/zvXGIZe8mMzdMq89inb7SVUHAtw6B
	rcBycBlhmoE+24DubVdNA1uuWX8cqU1OKqepg4VJNRnDUIW8+KNuOOS9Sdb0TfaWTxLO
	9/cA0KFphH4snqx33v0NnT/htRksuUSqZXSTLzEZn05G+7XvNhgI12dVA5Gtd0vF1JrA
	q0Ec/IAg8PgiubGcOqUI3r+sONqboo7QGB39RAxRldSX0LFK8VkhkwBpAJBNmuV0Phcu
	vIHA==
X-Gm-Message-State: AOAM533t4tmF+IQ5vvdo1tN3WVOV7MrXE3DmbmgkgR9z40SPUoo4ngYz
	4CioT2oaEul2r3uxvYYWIbAGwQ==
X-Google-Smtp-Source: ABdhPJxnRUZ2yc4qyUeE2swRcrRWqusKm5GVl93f2H70honYjIvEhAbIfNuoGyJsqfwYmYwZjdX5vw==
X-Received: by 2002:a1c:df04:: with SMTP id w4mr9976713wmg.158.1621411205505; 
	Wed, 19 May 2021 01:00:05 -0700 (PDT)
Received: from avi.scylladb.com (system.cloudius-systems.com. [199.203.229.89])
	by smtp.gmail.com with ESMTPSA id m9sm4485432wmq.40.2021.05.19.01.00.04
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Wed, 19 May 2021 01:00:05 -0700 (PDT)
To: Dave Chinner <david@fromorbit.com>, David Howells <dhowells@redhat.com>
References: <206078.1621264018@warthog.procyon.org.uk>
	<20210517232237.GE2893@dread.disaster.area>
From: Avi Kivity <avi@scylladb.com>
Organization: ScyllaDB
Message-ID: <ad2e8757-41ce-41e3-a22e-0cf9e356e656@scylladb.com>
Date: Wed, 19 May 2021 11:00:03 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
	Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210517232237.GE2893@dread.disaster.area>
X-Mimecast-Impersonation-Protect: Policy=CLT - Impersonation Protection
	Definition; Similar Internal Domain=false;
	Similar Monitored External Domain=false;
	Custom External Domain=false; Mimecast External Domain=false;
	Newly Observed Domain=false; Internal User Name=false;
	Custom Display Name List=false; Reply-to Address Mismatch=false;
	Targeted Threat Dictionary=false;
	Mimecast Threat Dictionary=false; Custom Threat Dictionary=false
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-loop: linux-cachefs@redhat.com
X-Mailman-Approved-At: Tue, 25 May 2021 09:17:16 -0400
Cc: Theodore Ts'o <tytso@mit.edu>, "Darrick J. Wong" <djwong@kernel.org>,
	linux-xfs@vger.kernel.org, Chris Mason <clm@fb.com>,
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


On 18/05/2021 02.22, Dave Chinner wrote:
>
>> What I'd like to do is remove the fanout directories, so that for each logical
>> "volume"[*] I have a single directory with all the files in it.  But that
>> means sticking massive amounts of entries into a single directory and hoping
>> it (a) isn't too slow and (b) doesn't hit the capacity limit.
> Note that if you use a single directory, you are effectively single
> threading modifications to your file index. You still need to use
> fanout directories if you want concurrency during modification for
> the cachefiles index, but that's a different design criteria
> compared to directory capacity and modification/lookup scalability.


Something that hit us with single-large-directory and XFS is that XFS 
will allocate all files in a directory using the same allocation group. 
If your entire filesystem is just for that one directory, then that 
allocation group will be contended. We saw spurious ENOSPC when that 
happened, though that may have related to bad O_DIRECT management by us.


We ended up creating files in a temporary directory and moving them to 
the main directory, since for us the directory layout was mandated by 
compatibility concerns.


We are now happy with XFS large-directory management, but are nowhere 
close to a million files.


--
Linux-cachefs mailing list
Linux-cachefs@redhat.com
https://listman.redhat.com/mailman/listinfo/linux-cachefs

