Return-Path: <linux-cachefs+bncBDLIXLMFVAERBEPLWSYAMGQE3SBRCCI@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com [209.85.167.200])
	by mail.lfdr.de (Postfix) with ESMTPS id 25C28896D53
	for <lists+linux-cachefs@lfdr.de>; Wed,  3 Apr 2024 12:55:15 +0200 (CEST)
Received: by mail-oi1-f200.google.com with SMTP id 5614622812f47-3c5d37b80e3sf269245b6e.2
        for <lists+linux-cachefs@lfdr.de>; Wed, 03 Apr 2024 03:55:15 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1712141714; cv=pass;
        d=google.com; s=arc-20160816;
        b=MTbQ6Lymkj8wruIFXQyxgJo6ew0RSReDA1WchHyZXmJxvQj9mIBcqzBUe74Vn2DEmF
         5Qg//aBg7DO2zkFnyGMJ6HNlYSbiv20Eq4CilJpQp5TlvynYQjf1pEvVI2vszUWVqeAy
         9rtmwZT+y20Hp08+rZRJ3WziJ2xykQk3TvxDUuh0+JOegvH786AWGFt69v/xpZi3S19G
         8WXSimSFkZuPmqGHAxYXAcWgtGgJcJoKq1Ki8FVvzJMPcdg5HBfZ4wtDU9hemrNTpvvk
         mR7T5B9WQ3FfNxHHajeDNqtYJKmf3eQ9DdPKIdsiFpeA00hs3e32WqCByfCBNpBRt9FP
         Jz/A==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-archive:list-help:list-post:list-id
         :mailing-list:precedence:content-id:message-id:date:mime-version
         :subject:cc:to:references:in-reply-to:from:organization:delivered-to;
        bh=RNLWXiuz+KIZeIaZgn4XqWoefheGesjzJ6lo5r8xxgU=;
        fh=G7APHmJ29odQCjolY5jGdfqLR2zqNgaf/NYwbuUdZMs=;
        b=ARxzvKorzLEsJpuDCFatOM0yB5Wa8/PPOdyOh3AiHR8WDWoUXLagMDC0pmbE1hFMER
         AIW2ZP4Y9jfLDp8r0KPBljCRj7aNlPT8lQneQiWmGZPPq8gF8hLU8n5tJKAS0ET4oqPj
         yomZlGB1qPmopJLNpBCnuag8QO0j5PBTiXwxmbxXZf8R/l92f0WPlerE/2PbTia2PXin
         eqwDtkFt2crZVGKZxBBcRnxLuCWmzxZ5918U7jyij0QznaGhKUoGPwo0U681ZSP1dRx+
         KRa3/CtM1Ds2fGd1B2E/fuqPr9EHrw7YEbHUXtZeDTCIyaRnfCJGGtJiKJKDUkDU/Cns
         +xRA==;
        darn=lfdr.de
ARC-Authentication-Results: i=2; mx.google.com;
       gateway.spf=pass (google.com: domain gapps.redhat.com configured 205.139.110.120 as internal address) smtp.mailfrom=dhowells@redhat.com smtp.remote-ip=205.139.110.120 policy.d=gapps.redhat.com
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712141714; x=1712746514;
        h=list-unsubscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender:content-id
         :message-id:date:mime-version:subject:cc:to:references:in-reply-to
         :from:organization:delivered-to:x-beenthere:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=RNLWXiuz+KIZeIaZgn4XqWoefheGesjzJ6lo5r8xxgU=;
        b=ooLms1j2iscJaun1J0MfLST+yqOz/fEMaL197Rgb/+iw+IZKOUM1F+6ZhAzFjxYLiC
         ra4AQeQNrxF8m+p9cj7i6YZhjwg9jQjhk4urzqkuknzXbjxO5tr05RMkeZbrwHw4ljU8
         rmQRmvWKRMODmfgFJbZxXiLVWfkij/qbAU28VpyBf1RIyeQOedBmS3n8UHS80sL8R9lA
         8ZHHgOeIL1ijhHr4JjIg4ByElI83r4GCSz/ly1ZMjg6//bahBP+isBqesZQs0Aez2uaz
         LZf5bLuXjKASoxAuVZPjMSN3B65DPcyzHDxnUQkcJpcIt80hZmoiaEAtQL2rE6s6Hgwn
         q6ZQ==
X-Forwarded-Encrypted: i=2; AJvYcCXdqXy4o0T3YxTWEo+8SQph8taNspQ0l3YTUt/fOeuZLkvz297age7fF2mK5+hkFMDG08m6rdZe6dn777JPKwvVaNQdR3OnqFZ9DN4=
X-Gm-Message-State: AOJu0YxqLExhYll+Y6WD07luZywQvorF6i+MM8NzW1eyfTUch6z/zHyC
	XA3i8MNzTEBo8pd72/GbrAB+MWtrj6FJyoKzhw+I92pDK4qasudEdbtbML3O10E=
X-Google-Smtp-Source: AGHT+IE1xtHkAUFj93quc3yexLFX7NI0mE/ClFi81lKecWmVu/m9Y6fVkR0G1WVezd1nP5fuq77ytg==
X-Received: by 2002:a05:6808:bcc:b0:3c3:8530:1413 with SMTP id o12-20020a0568080bcc00b003c385301413mr2356776oik.11.1712141713563;
        Wed, 03 Apr 2024 03:55:13 -0700 (PDT)
X-BeenThere: linux-cachefs@redhat.com
Received: by 2002:ac8:5d0e:0:b0:432:e560:1d2d with SMTP id f14-20020ac85d0e000000b00432e5601d2dls2104718qtx.2.-pod-prod-02-us;
 Wed, 03 Apr 2024 03:55:12 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWMzTgJsVwZgyfb/Pthgu9Eqkl07XXh14MK+vbwTSVihH6NhchCfYl7Eca5/Kfq58hnztpM5FUv006KNl/OllAJzqxRJM8XpLnOCXxjPZ0=
X-Received: by 2002:ac8:5816:0:b0:432:d620:6d47 with SMTP id g22-20020ac85816000000b00432d6206d47mr2378704qtg.52.1712141712776;
        Wed, 03 Apr 2024 03:55:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1712141712; cv=none;
        d=google.com; s=arc-20160816;
        b=dG+S3lXieiGlWhmhQFEg0ejHk7d6hmyhot3qGfozVDkgIPSednZkMcHxqyvnmDCiGo
         OuyMVXqNjkOYADwglDh+Wclb5WQWYd34HW2QJcdivHse7EC/ON3cvoCThpoBVcrfLG76
         xoepiyZQO1YGl/csc4B4ZCqiLjQrEaupvotbgD8yOpcciVhQu2wrxOLA+shlnCkabrCd
         mfs1lVFVbo4L80lTiM57aAFqOVXxb608A6QX5pzutCphsNY43H/63O789Zqu9okKVIKa
         fa3g8o4bF8qyOMOF5BosW8U1GQQSY1gTjsFevP23WShC3CN7LPtEub2/xRTWIbQ/DnAN
         Je1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-id:message-id:date:mime-version
         :subject:cc:to:references:in-reply-to:from:organization:delivered-to;
        bh=YdkUzWTxSFz7vzfseWxDgwdoSGZxGOsV19hRf29bg3U=;
        fh=OTg2WMHJtOqcpGTWyrCVDzG+wPN5q7xsQc52pUkpGv8=;
        b=zji9adEHwgKU/lC4D5huyaC55Rwk9Mg0pzWHRJTOHrv5NjfQe5ebIgqIXW1HYzIbvu
         Un1yPeODbELysVNn7asWfN7ytIbkjirBqnlbTMS30FM2M5RA2c2gQWhk0tnO6kA9kaKc
         aN0PtwrTAuiQIlnmG9vajrKCrRwNrv0CzWEz4gpQ4rQwkr8CYU1zjqhmvJyd8tBhffmN
         2V35+Po3WSXzUZS3S8qH6uM64K/PqFaHcrXei9uy8+jJt1SQaUfl60TVd+OKkV/Y3jMa
         hWqSo6/HzkhYxI2tqWo2PeFV9hspM7t5m4jHUh5Sh6Czw7BteHOf83Z+RpHh4wW8JQ+E
         gypw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       gateway.spf=pass (google.com: domain gapps.redhat.com configured 205.139.110.120 as internal address) smtp.mailfrom=dhowells@redhat.com smtp.remote-ip=205.139.110.120 policy.d=gapps.redhat.com
Received: from us-smtp-inbound-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com. [205.139.110.120])
        by mx.google.com with ESMTPS id y12-20020ac85f4c000000b004323982b115si14241778qta.607.2024.04.03.03.55.12
        for <linux-cachefs@gapps.redhat.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Apr 2024 03:55:12 -0700 (PDT)
Received-SPF: pass (google.com: domain gapps.redhat.com configured 205.139.110.120 as internal address)
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-562-WMpWcz9aMcinLcDtCFYkfA-1; Wed,
 03 Apr 2024 06:55:09 -0400
X-MC-Unique: WMpWcz9aMcinLcDtCFYkfA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 12DC72820B81
	for <linux-cachefs@gapps.redhat.com>; Wed,  3 Apr 2024 10:55:09 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
	id 0F35EC15775; Wed,  3 Apr 2024 10:55:09 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.uk (unknown [10.42.28.146])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 97C6CC1576F;
	Wed,  3 Apr 2024 10:55:05 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
	Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
	Kingdom.
	Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
In-Reply-To: <20240403101422.GA7285@lst.de>
References: <20240403101422.GA7285@lst.de> <20240403085918.GA1178@lst.de> <20240328163424.2781320-1-dhowells@redhat.com> <20240328163424.2781320-16-dhowells@redhat.com> <3235934.1712139047@warthog.procyon.org.uk>
To: Christoph Hellwig <hch@lst.de>
Cc: dhowells@redhat.com, Christian Brauner <christian@brauner.io>,
    Jeff Layton <jlayton@kernel.org>,
    Gao Xiang <hsiangkao@linux.alibaba.com>,
    Dominique Martinet <asmadeus@codewreck.org>,
    Matthew Wilcox <willy@infradead.org>,
    Steve French <smfrench@gmail.com>,
    Marc Dionne <marc.dionne@auristor.com>,
    Paulo Alcantara <pc@manguebit.com>,
    Shyam Prasad N <sprasad@microsoft.com>, Tom Talpey <tom@talpey.com>,
    Eric Van Hensbergen <ericvh@kernel.org>,
    Ilya Dryomov <idryomov@gmail.com>, netfs@lists.linux.dev,
    linux-cachefs@redhat.com, linux-afs@lists.infradead.org,
    linux-cifs@vger.kernel.org, linux-nfs@vger.kernel.org,
    ceph-devel@vger.kernel.org, v9fs@lists.linux.dev,
    linux-erofs@lists.ozlabs.org, linux-fsdevel@vger.kernel.org,
    linux-mm@kvack.org, netdev@vger.kernel.org,
    linux-kernel@vger.kernel.org
Subject: Re: [PATCH 15/26] mm: Export writeback_iter()
MIME-Version: 1.0
Date: Wed, 03 Apr 2024 11:55:00 +0100
Message-ID: <3300438.1712141700@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.8
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-ID: <3300437.1712141700.1@warthog.procyon.org.uk>
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

Christoph Hellwig <hch@lst.de> wrote:

> On Wed, Apr 03, 2024 at 11:10:47AM +0100, David Howells wrote:
> > That depends.  You put a comment on write_cache_pages() saying that people
> > should use writeback_iter() instead.  w_c_p() is not marked GPL.  Is it your
> > intention to get rid of it?
> 
> Yes.  If you think you're not a derivate work of Linux you have no
> business using either one.

So why are we bothering with EXPORT_SYMBOL at all?  Why don't you just send a
patch replace all of them with EXPORT_SYMBOL_GPL()?

David

-- 
You received this message because you are subscribed to the Google Groups "linux-cachefs@redhat.com" group.
To unsubscribe from this group and stop receiving emails from it, send an email to linux-cachefs+unsubscribe@redhat.com.

