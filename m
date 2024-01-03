Return-Path: <linux-cachefs+bncBDLIXLMFVAERBOE42WWAMGQE67FHKYY@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mail.lfdr.de (Postfix) with ESMTPS id D79B1822CA7
	for <lists+linux-cachefs@lfdr.de>; Wed,  3 Jan 2024 13:08:25 +0100 (CET)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-781d36705bcsf60301985a.1
        for <lists+linux-cachefs@lfdr.de>; Wed, 03 Jan 2024 04:08:25 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1704283705; cv=pass;
        d=google.com; s=arc-20160816;
        b=aHn7r0R62boMsGA39r3eC6ucbTYu6NeJ8QCk8I3KydhxxYaR350zO3pOT//6iffAYM
         2WXEYuvpfaoGRVD24Ne+m4mK5z34bjnW85iPp2aeWmcl0VyhPyP1q9uM8Mr2tyk8RvIO
         eLuVKzVenCBB+p75eXcRd5Hi+hL+K8UKmizAnwx3rEnAy+HvFK66xU2uZIB04Ly77pNa
         bMrCgl8nidC1RTvxzKlzHLpdAOoNqwKV2zvt5qoruC4aWk3x0e7fIxguPObnp6KQDaA9
         iHoF1Hi1ADZoywE4grBTSUSWVVcS39tIOiBs/98YCikWixJABf9XATyOTjmcZOm9czm4
         ONqg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-archive:list-help:list-post:list-id
         :mailing-list:precedence:content-id:message-id:date:mime-version
         :subject:cc:to:references:in-reply-to:from:organization:delivered-to;
        bh=MxiI4zDUDlt5RpJA/t9ba2keDXzHgCP5VhBK5Dv7gVI=;
        fh=iO1mnNj3+QcY16QMX2pVt5CjcQ/HcrO90z/0VmpgPXI=;
        b=uL4afHAe3Z4pqoHAl1VWyMJNi196mRIGDWXek0RbRvLC465RANqb+tAr/OU4zZF8xp
         jmDdrfOWwoNXfj5AMY3JtK/kGAVxUX5qesHHQiCqSTFdRvXX+eQqFZxbueLmPxXLdaoi
         rJrQzTfhe4qPPU0MvKje/sORaIP+ZRZmf3HnfyIRuluqTutd8/GmJwerBuO7Xps7j/mH
         qbQEVvBP3rT33tASah5kq+n4+XKqQ58WVmzR4PxmR/v30+7p1JmhSSs7JvdzRl0XIoul
         UHgcx+VmT2jpi3JUoPNAEh2fq5DQ+BCGMAaINXokBKzhBo0qv5ewTPidVGdIrh8R8B08
         JClw==
ARC-Authentication-Results: i=2; mx.google.com;
       gateway.spf=pass (google.com: domain gapps.redhat.com configured 207.211.31.120 as internal address) smtp.mailfrom=dhowells@redhat.com smtp.remote-ip=207.211.31.120 policy.d=gapps.redhat.com
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704283705; x=1704888505;
        h=list-unsubscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender:content-id
         :message-id:date:mime-version:subject:cc:to:references:in-reply-to
         :from:organization:delivered-to:x-beenthere:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=MxiI4zDUDlt5RpJA/t9ba2keDXzHgCP5VhBK5Dv7gVI=;
        b=MmZcgUrTnxM77CNhn6VlIs+KH0bQ39oQyjCmUuEe0VMOWZmOsiMbtOavFzFgXgjqTI
         KPDOkfJ6k/5ugL+/7MP/0Q8K7ojbOkDCVM2/SKUlbCGbz5WjPVoP/8ewL29RGOn66T5g
         4Yn+xWrk0owVkA+Rjj7M92v7LbKtirPI9B9CJ3+UYZoH/DmIWU1aZxtfndKU7nq0kVTO
         h+YI4NxsCYJ+qEhsCogRXxYg+fQ0CjA9/H5ZtI3ASx5/GleMBiaCm1yADuZP6bXoo5xo
         A2XG7azlNOChZZoWAE9Uz9IPZUO3cDftEWxoTvcMkwRMzXHulYaFBXe4kOYdST1RoKsD
         M1lA==
X-Gm-Message-State: AOJu0Yz0W7TauhKiF5ifNpm1G9iKGxy9GrN4m6upsd6UkJ3vlFMC9DWM
	8d5uEst2gLSkeWLGSCoJv93Urjl8VgaMGg==
X-Google-Smtp-Source: AGHT+IGJoHxGbIaCKxVjtqn+gkLwRZz9VV3ZocmtUkhMsBohiS0WLvurtqrMlJwI1phGU19um7JChw==
X-Received: by 2002:a05:620a:258f:b0:77f:97bd:fb31 with SMTP id x15-20020a05620a258f00b0077f97bdfb31mr1273419qko.63.1704283704700;
        Wed, 03 Jan 2024 04:08:24 -0800 (PST)
X-BeenThere: linux-cachefs@redhat.com
Received: by 2002:a05:6214:1313:b0:67a:9173:54f9 with SMTP id
 pn19-20020a056214131300b0067a917354f9ls373971qvb.1.-pod-prod-00-us; Wed, 03
 Jan 2024 04:08:24 -0800 (PST)
X-Received: by 2002:ad4:5cc1:0:b0:67f:398f:b6d9 with SMTP id iu1-20020ad45cc1000000b0067f398fb6d9mr1238105qvb.10.1704283704159;
        Wed, 03 Jan 2024 04:08:24 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1704283704; cv=none;
        d=google.com; s=arc-20160816;
        b=CLujIc9Gl3HtE0YziMvyGepzyGcDnDjvnDTyvHw5UUGjaV9XheelqLonqzgS2Qsq2I
         cQGzZZ4KQP0OuAmjPviW1D0ABVA87Z7EIgi/UTFHi1G1vEW04Qj1zw/OqfKVaIID8ksd
         AZhHAeTZNy+5X9KVEzTmjo2qbxIWKhKW/2HGbu1h+ywAeh6Ypz2LHJ6FVr+OCyTWw+fS
         qOWFwuj+4rll5IjW0YSK7N20f9vFeZ+Bmwseoy4ysDTsvtqs46YdytOUYkHD+iL+lWlR
         LM4nYCkgTXzrluXwty+jZQPpnGEACq5iGKh12qcpJKaTHQ1Zlx4sdL5ZikvGyq1XFBYc
         aJ9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-id:message-id:date:mime-version:subject:cc:to:references
         :in-reply-to:from:organization:delivered-to;
        bh=Xn3hPmKlXFLs1haHAodNqDYoLKo2JnMk0c6eSg9WYzE=;
        fh=iO1mnNj3+QcY16QMX2pVt5CjcQ/HcrO90z/0VmpgPXI=;
        b=RTE0iZn/dAyuduVt9tgIfIja2qLIH9VVhxTqZR+zKO+wQR66peo8rT1d9ytDf+9oe+
         T9bpSdmrvB0/5Cc1F+/4HNNdes/kZ+i65twgjFNSifMCUWit9hsh+T8PRwO6xAx0Cwo6
         1CjNV/DqKLpGh7I2f269j3dw/OcAg7+DL6P8y5AomSmLx4sHz6+2uM4Vby/M2TE0LuW7
         u793HE11OA6F4P5Pfkkq1XXN1Xvjq6DnuVkefMW4JMVxUBHSAqr76tPJtRdeNT6fhEwX
         rbbMbFrLYkGNXRWWUQrJSlLMetbC1P8Oe6RkI2ILQrsaI/SGCQhxZG/bQvXM5G3GDBCl
         Yeog==
ARC-Authentication-Results: i=1; mx.google.com;
       gateway.spf=pass (google.com: domain gapps.redhat.com configured 207.211.31.120 as internal address) smtp.mailfrom=dhowells@redhat.com smtp.remote-ip=207.211.31.120 policy.d=gapps.redhat.com
Received: from us-smtp-inbound-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com. [207.211.31.120])
        by mx.google.com with ESMTPS id d7-20020a0cb2c7000000b0067aa6f73d6asi7483086qvf.303.2024.01.03.04.08.24
        for <linux-cachefs@gapps.redhat.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jan 2024 04:08:24 -0800 (PST)
Received-SPF: pass (google.com: domain gapps.redhat.com configured 207.211.31.120 as internal address)
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-373-05kBP6f4OROua8t8AiQDHQ-1; Wed, 03 Jan 2024 07:08:22 -0500
X-MC-Unique: 05kBP6f4OROua8t8AiQDHQ-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 17B5E8493EB
	for <linux-cachefs@gapps.redhat.com>; Wed,  3 Jan 2024 12:08:22 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
	id 12344492BFA; Wed,  3 Jan 2024 12:08:22 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.uk (unknown [10.42.28.68])
	by smtp.corp.redhat.com (Postfix) with ESMTP id C516D492BE6;
	Wed,  3 Jan 2024 12:08:18 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
	Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
	Kingdom.
	Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
In-Reply-To: <ZZULNQAZ0n0WQv7p@codewreck.org>
References: <ZZULNQAZ0n0WQv7p@codewreck.org> <20231221132400.1601991-1-dhowells@redhat.com> <20231221132400.1601991-41-dhowells@redhat.com>
To: Dominique Martinet <asmadeus@codewreck.org>
Cc: dhowells@redhat.com, Jeff Layton <jlayton@kernel.org>,
    Steve French <smfrench@gmail.com>,
    Matthew Wilcox <willy@infradead.org>,
    Marc Dionne <marc.dionne@auristor.com>,
    Paulo Alcantara <pc@manguebit.com>,
    Shyam Prasad N <sprasad@microsoft.com>, Tom Talpey <tom@talpey.com>,
    Eric Van Hensbergen <ericvh@kernel.org>,
    Ilya Dryomov <idryomov@gmail.com>,
    Christian Brauner <christian@brauner.io>, linux-cachefs@redhat.com,
    linux-afs@lists.infradead.org, linux-cifs@vger.kernel.org,
    linux-nfs@vger.kernel.org, ceph-devel@vger.kernel.org,
    v9fs@lists.linux.dev, linux-fsdevel@vger.kernel.org,
    linux-mm@kvack.org, netdev@vger.kernel.org,
    linux-kernel@vger.kernel.org, Latchesar Ionkov <lucho@ionkov.net>,
    Christian Schoenebeck <linux_oss@crudebyte.com>
Subject: Re: [PATCH v5 40/40] 9p: Use netfslib read/write_iter
MIME-Version: 1.0
Date: Wed, 03 Jan 2024 12:08:18 +0000
Message-ID: <354050.1704283698@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.10
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-ID: <354049.1704283697.1@warthog.procyon.org.uk>
X-Original-Sender: dhowells@redhat.com
X-Original-Authentication-Results: mx.google.com;       gateway.spf=pass
 (google.com: domain gapps.redhat.com configured 207.211.31.120 as internal
 address) smtp.mailfrom=dhowells@redhat.com smtp.remote-ip=207.211.31.120 policy.d=gapps.redhat.com
Precedence: list
Mailing-list: list linux-cachefs@redhat.com; contact linux-cachefs+owners@redhat.com
List-ID: <linux-cachefs.redhat.com>
X-Spam-Checked-In-Group: linux-cachefs@redhat.com
X-Google-Group-Id: 998933772329
List-Post: <https://groups.google.com/a/redhat.com/group/linux-cachefs/post>, <mailto:linux-cachefs@redhat.com>
List-Help: <https://support.google.com/a/redhat.com/bin/topic.py?topic=25838>, <mailto:linux-cachefs+help@redhat.com>
List-Archive: <https://groups.google.com/a/redhat.com/group/linux-cachefs/>
List-Unsubscribe: <mailto:googlegroups-manage+998933772329+unsubscribe@googlegroups.com>,
 <https://groups.google.com/a/redhat.com/group/linux-cachefs/subscribe>

Dominique Martinet <asmadeus@codewreck.org> wrote:

> I've also manually confirmed one of the big improvements I'd been asking
> for (that writes in cached modes, which used to be chunked to 4k, and
> are now properly aggregated, so e.g 'dd bs=1M count=1' will properly
> issue a minimal number of TWRITE calls capped by msize) -- this is
> great!

After the merge window, we can look at enabling multipage folios for 9p.

> I've noticed we don't cache xattrs are all,

I haven't given this any particular thought.  We could attach them to the
cachefile object as xattrs, but it means you have to do two xattr lookups in
the event of a cache miss.

At this point, I'm going to ask Christian to stack the extra patch on his
branch rather than folding it down and retagging.

> I've got a couple of questions below, but:

I'll address those separately.

> Tested-by: Dominique Martinet <asmadeus@codewreck.org>
> Acked-by: Dominique Martinet <asmadeus@codewreck.org>

Thanks!

David

-- 
You received this message because you are subscribed to the Google Groups "linux-cachefs@redhat.com" group.
To unsubscribe from this group and stop receiving emails from it, send an email to linux-cachefs+unsubscribe@redhat.com.

