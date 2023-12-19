Return-Path: <linux-cachefs+bncBDLIXLMFVAERBTEWQ6WAMGQEGUSGPIY@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com [209.85.167.199])
	by mail.lfdr.de (Postfix) with ESMTPS id 19DFF818D0C
	for <lists+linux-cachefs@lfdr.de>; Tue, 19 Dec 2023 17:56:46 +0100 (CET)
Received: by mail-oi1-f199.google.com with SMTP id 5614622812f47-3b9d731fd1bsf5924306b6e.1
        for <lists+linux-cachefs@lfdr.de>; Tue, 19 Dec 2023 08:56:46 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1703005005; cv=pass;
        d=google.com; s=arc-20160816;
        b=UihcKFcHc+LxHHDTT4ZikyBzCiigvvDnFVqaZnlD5pVYQ2t1cKRv1eRDQ9HwLaWqu1
         jA84LSYgTcabAlnCcfeTWcUiZQbgdQACmWNfWcpA9etz1ryE1OVrXOqpLahm3EVvKW7f
         8HDZ65bm/0WomrhF9EBjQUZ3EJLieyn9MA7lih6ecnsZSAk6XPAroNRx/BvkJpTRssUS
         jlLl/C5EEEd+VAeFwGn2oDEQquIbaxDfiEi0DPSzrZ7mn9Ef5zBcL4W3ZSP9lebqruon
         2dVFXmASTrUg6XYV6i0pPLUIGS9W1gmGV+hVFg16Xm6EHqtKQ2PotD2CWzHiqIsQTUpg
         eYMQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-archive:list-help:list-post:list-id
         :mailing-list:precedence:content-id:message-id:date:mime-version
         :subject:cc:to:references:in-reply-to:from:organization:delivered-to;
        bh=eeG/DRfRJiWtlBWQ9cEWFsisskxve0uKWvhkLSqvAy4=;
        fh=oTSheoojIQWE85h15wIbFV5tdQ792s9VwZPsELvSY7c=;
        b=0N21V+Fu83sHu0WyEu4guMlfk7aCL7d9RoZMm8/cL7pDc10ap6uwIwIPK1Y5Euz3O4
         uPgIXcNTIOt6CisWUwvIEhU8NVBOiyYWqO77kZ7GSQycCfIuGbBzdcT2OT6kOpzJ0RVV
         /dEv+u3gS7XzK6KfHyRM4dPY0Nj38gr5A65WqRbV3d50SoijrTQqsNiYwstskdfzbIo8
         G1SKiajdVLmELsRk/ebRVDxZB3T4IEDw4Jmy6LyfqZbIzZOxEO3DdbQKDHJcL46DDMbF
         v/WUmIV7RZImngNBTTH5SAO8l+/98mJzuez0PSVWmxE1v3qxzcKf1Cl+MCYvzlUt9QQu
         GJOg==
ARC-Authentication-Results: i=2; mx.google.com;
       gateway.spf=pass (google.com: domain gapps.redhat.com configured 205.139.110.120 as internal address) smtp.mailfrom=dhowells@redhat.com smtp.remote-ip=205.139.110.120 policy.d=gapps.redhat.com
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703005005; x=1703609805;
        h=list-unsubscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender:content-id
         :message-id:date:mime-version:subject:cc:to:references:in-reply-to
         :from:organization:delivered-to:x-beenthere:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=eeG/DRfRJiWtlBWQ9cEWFsisskxve0uKWvhkLSqvAy4=;
        b=DYmBqgFGmeUeUL4uX/J7f/j8y521AhtTUK73XxWy5UphT1tJiMy0Jwp1DGO5AhTwS2
         VYJFQSJ0OhZXdjPuclWfdcIDuVHgHGpYjrsmmhOpySu3OE3W4VdNq07VmeRgqSUX2QkQ
         sHE5LO9k8ZFSR1LLL8/ihK5b8i8bgchz/m20QTkAQOcdAZrl+jQHCMSui2g8LUt0Zmow
         cRS/fC5VPHT8fNAeifLj6Xjly+YcPH54sKeUe8i8KHGJJiZ0n7T+E9+3cKho6J7KCWhN
         cGSV1obWwtlmnPZXMDVsiBNW0w2BGDQ3qYPVnqk/BpckjbnGc37zONwLP9KHHoaiNKbP
         9MCA==
X-Gm-Message-State: AOJu0YywnN9Yiow9qz9OzfWGqZHP2X72fOi5oiwX+Hbgf4hMlf859UbA
	/vypVznoZroJHFs494WLbq613A==
X-Google-Smtp-Source: AGHT+IGWSZmQhYRiC70era3JOcgpOPNtUQrajzFCght5I3C8KRjIHY5YGICSThCcuzJ0kuJXeV6jJg==
X-Received: by 2002:a05:6808:198d:b0:3b8:b063:6b8d with SMTP id bj13-20020a056808198d00b003b8b0636b8dmr24194983oib.60.1703005004989;
        Tue, 19 Dec 2023 08:56:44 -0800 (PST)
X-BeenThere: linux-cachefs@redhat.com
Received: by 2002:ad4:4ea7:0:b0:670:a1c0:e4e2 with SMTP id ed7-20020ad44ea7000000b00670a1c0e4e2ls3027947qvb.1.-pod-prod-04-us;
 Tue, 19 Dec 2023 08:56:44 -0800 (PST)
X-Received: by 2002:a05:6214:765:b0:67f:40cd:84df with SMTP id f5-20020a056214076500b0067f40cd84dfmr6403065qvz.29.1703005004422;
        Tue, 19 Dec 2023 08:56:44 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1703005004; cv=none;
        d=google.com; s=arc-20160816;
        b=KJF5uKFr8yYav7e5cXvnXaWEaZantdCfgHqYy0rZT4+IiH2ht9CAgskXXfeY0Sn7v9
         fUR7dlvOHHUql/bKDNz4ckbicFM5JENM3o09Fn9r9atI+qexwV4pCeTht1k1atZFjrYm
         No4jsIlxvcGJb0dupmAaTX0gI3CwtTnIEGjXaPbdmG9Xd0rUn4iNlTR2yFSBOX4ulKEh
         XKus6H95rMtWpQTTaF93efefQfbhEK2TXUYewMU9RltjuBNvK72oArPs/Gouvd0aYVqc
         hjWAdAnrGWllTgug5AnmkAM7VHDi5xXgV0dyIJDTe+ywDselxvoDlE1D7ATKnkmD8bRZ
         jhzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-id:message-id:date:mime-version:subject:cc:to:references
         :in-reply-to:from:organization:delivered-to;
        bh=B719XTWiXIHllaEXvsXPz/Q4Bs162RLSRke3FIDQ97A=;
        fh=oTSheoojIQWE85h15wIbFV5tdQ792s9VwZPsELvSY7c=;
        b=hAu35Y75rea5Q9hoy0v87OHbiH5wOt6nBRG2X/Gf4lO7WjjcUDj4dqu1PCMdhFGCeK
         bUnkVE+bjzmE0+o/pF1AwLABsDMLhufIKt0XMfrjiG/tZJjUbaUXGWhnqP8Y3k/jvih4
         j6I56duMf3fYqtBU3D0J1mUb0/QWC7Ns3/niyJhFY4+Q8bKdnROSt8Zj8pTAxx2Xjr+P
         B8QBMSvycf5M+W/UogSY4aT8xesgcT5kZHRjvBHmsmCyxWgVbVRGASN+XqTEMnaNCZLV
         yeuYhXXjMr4FYt/sbEjZHjcc9SuSYkBLliCXgiQFzv/41K8W5Vn91Sv27QmqSTozm+vF
         A8cw==
ARC-Authentication-Results: i=1; mx.google.com;
       gateway.spf=pass (google.com: domain gapps.redhat.com configured 205.139.110.120 as internal address) smtp.mailfrom=dhowells@redhat.com smtp.remote-ip=205.139.110.120 policy.d=gapps.redhat.com
Received: from us-smtp-inbound-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com. [205.139.110.120])
        by mx.google.com with ESMTPS id e27-20020a0cb45b000000b0067f032d7c53si13252112qvf.112.2023.12.19.08.56.44
        for <linux-cachefs@gapps.redhat.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Dec 2023 08:56:44 -0800 (PST)
Received-SPF: pass (google.com: domain gapps.redhat.com configured 205.139.110.120 as internal address)
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-606-n-Ke4ugjMMOJa-PJR0um8Q-1; Tue, 19 Dec 2023 11:56:42 -0500
X-MC-Unique: n-Ke4ugjMMOJa-PJR0um8Q-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com [10.11.54.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A783A832D1F
	for <linux-cachefs@gapps.redhat.com>; Tue, 19 Dec 2023 16:56:42 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
	id A16BF2026F95; Tue, 19 Dec 2023 16:56:42 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.uk (unknown [10.39.195.169])
	by smtp.corp.redhat.com (Postfix) with ESMTP id D48152026D66;
	Tue, 19 Dec 2023 16:56:39 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
	Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
	Kingdom.
	Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
In-Reply-To: <8b9413cc37a231a97059c7d028d404ab35363764.camel@kernel.org>
References: <8b9413cc37a231a97059c7d028d404ab35363764.camel@kernel.org> <20231213152350.431591-1-dhowells@redhat.com> <20231213152350.431591-38-dhowells@redhat.com>
To: Jeff Layton <jlayton@kernel.org>
Cc: dhowells@redhat.com, Steve French <smfrench@gmail.com>,
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
    linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 37/39] netfs: Optimise away reads above the point at which there can be no data
MIME-Version: 1.0
Date: Tue, 19 Dec 2023 16:56:39 +0000
Message-ID: <1075373.1703004999@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.4
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-ID: <1075372.1703004999.1@warthog.procyon.org.uk>
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

Jeff Layton <jlayton@kernel.org> wrote:

> >  (4) On local truncation up, we don't change zero_point.
> > 
> 
> The above seems odd, but I guess the assumption is that if there are any
> writes by a 3rd party above the old zero point, that that would cause an
> invalidation?

All truncating up does is extend the region from which reading would return
zeros, so it doesn't affect the zero_point.

If a third party interferes, then we have to invalidate the local caches and
reset zero_point to the EOF.  But if a third party is writing to the file at
the same time as you without both of you using locking or exclusive direct
writes, your data is probably screwed anyway...

Something cifs and ceph can use leasing to make this work; afs uses the data
version number, notifications and the principle that you should use file
locks.

David

-- 
You received this message because you are subscribed to the Google Groups "linux-cachefs@redhat.com" group.
To unsubscribe from this group and stop receiving emails from it, send an email to linux-cachefs+unsubscribe@redhat.com.

