Return-Path: <linux-cachefs+bncBDLIXLMFVAERBOEC6WYQMGQE6UHZHNA@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from mail-oo1-f72.google.com (mail-oo1-f72.google.com [209.85.161.72])
	by mail.lfdr.de (Postfix) with ESMTPS id 947578C1865
	for <lists+linux-cachefs@lfdr.de>; Thu,  9 May 2024 23:33:46 +0200 (CEST)
Received: by mail-oo1-f72.google.com with SMTP id 006d021491bc7-5aa338a43c8sf1086562eaf.1
        for <lists+linux-cachefs@lfdr.de>; Thu, 09 May 2024 14:33:46 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1715290425; cv=pass;
        d=google.com; s=arc-20160816;
        b=yBsfAHU9fRflRutdJl3gtBocjy6hGlXpFL1AGMUAKC6gdkkdntT/mSxDE13ZYC2HH5
         t+KSe3ezt0BWaeJd4tZT4vnRir2d+oCjlVtX4a/qrdX7bnugyWisEYvSxEXmmNYx81+P
         D4nFCtjkEAHebPrZoRbf/QoSScRqXDAdUF5+sSfLZzf9cEWeQHI/nlYTk9FevofNvKyq
         xpFR8+MeSEpw2qSMwuB8IEMDBw9YWMPnB4d3DijN1XwXgwSnvQIy+EA4tg8ORRK7KmnP
         QX3tKnyTVhaMRdkgWmC9NhngNIuAOiu/JV/jJkBC2EvpT2sj2bFGK59YheUfM08BlwLm
         9ecg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-archive:list-help:list-post:list-id
         :mailing-list:precedence:content-id:message-id:date:mime-version
         :subject:cc:to:references:in-reply-to:from:organization:delivered-to;
        bh=wz4ihmAwT6Z5v2y4lEsrl96WZgEJ50uNu67jBP2EdZM=;
        fh=m97aMsqMg+uA4NmGdTkwLwO2dicG+6gjytPklLbj9V4=;
        b=dOzmt2Pgm5X7cEmKlED7zMbNnZDKbs3NNOkwQ5Nr7th65C81EQtmSXc92EyJ0PKRXI
         XkXuwcR3eQdmW77wEGcQQIxOp/mB6+PpLDYOjsKw6jAi4etC8oA2PlwcGCC5ENngxCfC
         yxSLbD6YXKmCreHWI2In2/gmSbaz/iqALrf3jUmQMISfbJWteVtoathqp0pCvae65xCd
         zl11jQWl+YRh8Pm9m2UAgqGvGiO6gUIpkIjZXlAsPZCoqNhvEqvyyvErALVbCyPVJOT/
         +6xPOpGZYeS2Ubiz44V+eoYQLJqb46ues/W7HZQkwPwpz0Vk6jhiFWc3masAILLyU38K
         2ODw==;
        darn=lfdr.de
ARC-Authentication-Results: i=2; mx.google.com;
       gateway.spf=pass (google.com: domain gapps.redhat.com configured 205.139.110.120 as internal address) smtp.mailfrom=dhowells@redhat.com smtp.remote-ip=205.139.110.120 policy.d=gapps.redhat.com
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715290425; x=1715895225;
        h=list-unsubscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender:content-id
         :message-id:date:mime-version:subject:cc:to:references:in-reply-to
         :from:organization:delivered-to:x-beenthere:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=wz4ihmAwT6Z5v2y4lEsrl96WZgEJ50uNu67jBP2EdZM=;
        b=vKdIFfWRN5Uqb9Pj7dFAFiV6bKwSuhqxnmOLAkjems9hOlW2r0Q9ND+ckM7we1+lrJ
         CFFaCnjcX+z2ZGb0TvnbftUpybTYs7AP+xKpSfKFo6Vqu+w/FkpZjk01Ed7tNEC7PgMF
         9dm5oQYViyc/OqHbtcKPAEnVKF5INJS0FskQ2bq3dCl+L3sZNPpsIlnGd0ncP8XYfREk
         I2h3qKkiNd5wQ50w9xkmqb7G9buZeJ+XbQoREVs0bNcT+8MPuzfGMbPKhM6dXpVXEaTe
         Bfm4xy6szIeNCpYJlVyWgR9zIHHELlaIY0Zq63ZqcXqyVXvuA9QnJKsvz2Wse0o/BWTj
         N6bQ==
X-Forwarded-Encrypted: i=2; AJvYcCUWXtZnHtf5HFBYuRB7xHkyNj2zDIbdEpkAiHGDUTaB8+0n6124ucaWKoVHY3wtATK7vFRlu1909/OyDgtpGJKiDA+H9mI1iJ2RtRI=
X-Gm-Message-State: AOJu0Yz/M8S1ymusrVQccWpaK+5vW7H4h+hOVQ0AMv7mwtluGNrj/mpp
	frD9wKwnjzFeLZZiHb8kMiSxkOojbnxeCdLuK2sjA6Cu5Oh7fFdWY0da817bDbg=
X-Google-Smtp-Source: AGHT+IGO7vFDX5wEuVMfUBkN0CHk9vyBD1ud+l+fIVnsldFJ741+bf7LXcmv6kDxtHGEs5AKjy3kmQ==
X-Received: by 2002:a4a:988e:0:b0:5b2:3f04:8d04 with SMTP id 006d021491bc7-5b28196aa7amr691818eaf.4.1715290424932;
        Thu, 09 May 2024 14:33:44 -0700 (PDT)
X-BeenThere: linux-cachefs@redhat.com
Received: by 2002:a4a:46:0:b0:5af:c4b3:9d4f with SMTP id 006d021491bc7-5b26a7ede85ls1311407eaf.2.-pod-prod-06-us;
 Thu, 09 May 2024 14:33:44 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCX4/e5m6P1oAJszQ8tT6N6ZS6x3MGh92JhxRrgYFYnR6n9/EHYkiaO6yaryHLM9Sm6jl/1LRr1yWEytx0qM691bmyF3zbiRrbrYwPgbA2Y=
X-Received: by 2002:a05:6830:71a1:b0:6ee:45e0:8cbc with SMTP id 46e09a7af769-6f0e9127555mr793907a34.12.1715290424104;
        Thu, 09 May 2024 14:33:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1715290424; cv=none;
        d=google.com; s=arc-20160816;
        b=WGtnXTYV71SzIDu5k2YfeZ+nYGGNpNCBxxVv3mZiEB78LZwrtE0DRRODoELgHQ8bmp
         9CHwCknxpBrPcLQyVYhzhoZXF4Jnc7Wp/qbEoTJmmKVTV0O6/EOWZhP3EznrGQyhJ1F8
         UtrCZVR8EHTagOmmiKccdxoxORae+/sVM6uohbCXUS9fYI+wpAVD6+z5HghEoykPe8Bl
         alBZfjPt/uEVa9qXJANagiB3QVrBX8vREutfMq8uBZdHO4OtgqL78RcoHnri4nXhPYQ9
         AaWLc7sV+C/Kt14KzzQEStrIxh9UsoiAQ8ffsxsOdGwxpooY/t+35NV2DR+6CmqkJJE9
         /kPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-id:message-id:date:mime-version
         :subject:cc:to:references:in-reply-to:from:organization:delivered-to;
        bh=kCUbMvJUFbX54hCwGv8znxU/24abT0F2823j98em7gg=;
        fh=Ndl4y6TQgpJMhZetPQknYnZfU2jhAQpMn6ov6D6ReDI=;
        b=MzyH8eQW+qVUX9pzENYRcloySUp2Jwb5gRSA5M97iOnA8VKrBMFlTlkyS/sYIw7O0V
         5jlU8BMlhrzBLuKwL5aZ692IpjDMLNz4q94u4jG3en6F7Kmz0fqkuzHaS895mr5T+/pZ
         aHqkKv8bz08xDjGEdOuJQY1luU40fjKFmGFgme84FomP19nqDxjyYpBNmILhUesi4wMq
         w2m8++cMuSrcq+5J48nbjt8O3NgME8K79wcsI0ftAztkO2HlFZzG2pLZAEVow60WF9kP
         YbLlTWZYtQ3wFXQxEnPXsgptzbYDmRwAQsHCWoiLcu8k/PsK6ihmdMXAFEhLGE8Z4J+v
         O2KA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       gateway.spf=pass (google.com: domain gapps.redhat.com configured 205.139.110.120 as internal address) smtp.mailfrom=dhowells@redhat.com smtp.remote-ip=205.139.110.120 policy.d=gapps.redhat.com
Received: from us-smtp-inbound-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com. [205.139.110.120])
        by mx.google.com with ESMTPS id af79cd13be357-792bf278946si208545685a.152.2024.05.09.14.33.43
        for <linux-cachefs@gapps.redhat.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 May 2024 14:33:44 -0700 (PDT)
Received-SPF: pass (google.com: domain gapps.redhat.com configured 205.139.110.120 as internal address)
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-526-Q3wWwR4pM_OxPt8cuF8sVg-1; Thu,
 09 May 2024 17:33:42 -0400
X-MC-Unique: Q3wWwR4pM_OxPt8cuF8sVg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com [10.11.54.3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3B20F1C031C1
	for <linux-cachefs@gapps.redhat.com>; Thu,  9 May 2024 21:33:42 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
	id 38287116F843; Thu,  9 May 2024 21:33:42 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.uk (unknown [10.42.28.34])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 12FA0116F842;
	Thu,  9 May 2024 21:33:37 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
	Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
	Kingdom.
	Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
In-Reply-To: <Zj0ErxVBE3DYT2Ea@gpd>
References: <Zj0ErxVBE3DYT2Ea@gpd> <20231221132400.1601991-1-dhowells@redhat.com> <20231221132400.1601991-41-dhowells@redhat.com>
To: Andrea Righi <andrea.righi@canonical.com>
Cc: dhowells@redhat.com, Jeff Layton <jlayton@kernel.org>,
    Steve French <smfrench@gmail.com>,
    Matthew Wilcox <willy@infradead.org>,
    Marc Dionne <marc.dionne@auristor.com>,
    Paulo Alcantara <pc@manguebit.com>,
    Shyam Prasad N <sprasad@microsoft.com>, Tom Talpey <tom@talpey.com>,
    Dominique Martinet <asmadeus@codewreck.org>,
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
Date: Thu, 09 May 2024 22:33:37 +0100
Message-ID: <1567252.1715290417@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.3
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-ID: <1567251.1715290417.1@warthog.procyon.org.uk>
X-Original-Sender: dhowells@redhat.com
X-Original-Authentication-Results: mx.google.com;       gateway.spf=pass
 (google.com: domain gapps.redhat.com configured 205.139.110.120 as internal
 address) smtp.mailfrom=dhowells@redhat.com smtp.remote-ip=205.139.110.120 policy.d=gapps.redhat.com
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

Andrea Righi <andrea.righi@canonical.com> wrote:

> On Thu, Dec 21, 2023 at 01:23:35PM +0000, David Howells wrote:
> > Use netfslib's read and write iteration helpers, allowing netfslib to take
> > over the management of the page cache for 9p files and to manage local disk
> > caching.  In particular, this eliminates write_begin, write_end, writepage
> > and all mentions of struct page and struct folio from 9p.
> > 
> > Note that netfslib now offers the possibility of write-through caching if
> > that is desirable for 9p: just set the NETFS_ICTX_WRITETHROUGH flag in
> > v9inode->netfs.flags in v9fs_set_netfs_context().
> > 
> > Note also this is untested as I can't get ganesha.nfsd to correctly parse
> > the config to turn on 9p support.
> 
> It looks like this patch has introduced a regression with autopkgtest,
> see: https://bugs.launchpad.net/bugs/2056461
> 
> I haven't looked at the details yet, I just did some bisecting and
> apparently reverting this one seems to fix the problem.
> 
> Let me know if you want me to test something in particular or if you
> already have a potential fix. Otherwise I'll take a look.

Do you have a reproducer?

I'll be at LSF next week, so if I can't fix it tomorrow, I won't be able to
poke at it until after that.

David

To unsubscribe from this group and stop receiving emails from it, send an email to linux-cachefs+unsubscribe@redhat.com.

