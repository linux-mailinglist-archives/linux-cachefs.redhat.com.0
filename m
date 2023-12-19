Return-Path: <linux-cachefs+bncBDLIXLMFVAERBQW2Q2WAMGQE4P7XYQY@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from mail-oi1-f197.google.com (mail-oi1-f197.google.com [209.85.167.197])
	by mail.lfdr.de (Postfix) with ESMTPS id 894A4818A65
	for <lists+linux-cachefs@lfdr.de>; Tue, 19 Dec 2023 15:48:35 +0100 (CET)
Received: by mail-oi1-f197.google.com with SMTP id 5614622812f47-3b9d731fd1bsf5761359b6e.1
        for <lists+linux-cachefs@lfdr.de>; Tue, 19 Dec 2023 06:48:35 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1702997314; cv=pass;
        d=google.com; s=arc-20160816;
        b=0c0s+MHqQe0sJrB3Dur/4jJnq1/dRiQlVpf0L01bbABPnpNfVMD0RU2b5viSXD3fLB
         1il0uwWO3JPxaJIcbedpSyF9sn9Om4pCY0eyUVviq+4nFqGAWLA2oY08Zo/3UCIgxK9j
         1pU+rr+7tVfpb4XdEy2NHt00arY5vIO2QfLY6KobmOj2ef79t43QKvlGVYbz4DcArTuq
         fKgsmXIw3zHiVqJZDLAvHtxPHriH9po0Wo1aXC0DWdIOVLD0sgAdNb/WJCXsC3vDfhfu
         ocLqQuWarI3/nm6wXmOCEVzP65LZLw27y5bPH8UQY4LAFN61qPCjqA2kxwEVR1eWVJyX
         PLPQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-archive:list-help:list-post:list-id
         :mailing-list:precedence:content-id:message-id:date:mime-version
         :subject:cc:to:references:in-reply-to:from:organization:delivered-to;
        bh=owFpZ7ErbHQ9cHo+awvhIQV6/Xn/Ht+Za0YeZicVE1g=;
        fh=oTSheoojIQWE85h15wIbFV5tdQ792s9VwZPsELvSY7c=;
        b=jsxgDwcLgc8z5oAy18qLHxYT5Uy2eEkN6zWWsoLEujnMcajxaJXx4Y+EzV56xNaPVs
         uHCXIsNpU8eXKomXwal6SLRQ08DdXG8WBa/CiOC+gMfXB83l/fPkFxh0JjzxTbXszOYb
         ZtTQ+72jPsJ4Fcw98xfd5RBSMFfhxHSW/qXEXLQxEbvDLZj64uLLM7A5SreI+9b7c+cI
         P4934f4OW7+Wf+6NJB5uPNszKCl5XO/+NQrSYcXy7vwDhF2wU/46oknasVOSS3ss3Pne
         hyuaVcsvNU/2O2e9yCSrqyVPrjMj/Q8Bpr1NP0jC5eBWCs/5UZGPrDZjYA54HCsraWvC
         pNnQ==
ARC-Authentication-Results: i=2; mx.google.com;
       gateway.spf=pass (google.com: domain gapps.redhat.com configured 207.211.31.120 as internal address) smtp.mailfrom=dhowells@redhat.com smtp.remote-ip=207.211.31.120 policy.d=gapps.redhat.com
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702997314; x=1703602114;
        h=list-unsubscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender:content-id
         :message-id:date:mime-version:subject:cc:to:references:in-reply-to
         :from:organization:delivered-to:x-beenthere:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=owFpZ7ErbHQ9cHo+awvhIQV6/Xn/Ht+Za0YeZicVE1g=;
        b=ud767uO6bpzCvzlC0QPv8MKTOtwX9eZ0ZPWTILXSzjEUc/ZDkEFek/inUzwYZp+DFc
         aqWXn+cmU/VRVnXvq1jV+dSohf0cmsn+cZInH/t6EwOeX9mvY5S/chcUtYEtr7SMtjKZ
         g9HJ9jJEQYaMp3qwdYM0r5X0Dv5NA556b445JRLdl9tDR6ctSxe3TPxE0u3JZrATAVz6
         4hvsd2cm7953qvztbxRb+kZCsHKIX3PlVvO7X8CNVCHISjk8EnsacLGV8mkdiCHdSlOn
         TKlSIstXwSPyNp1uBR66uRiI1BWCBSGGQec7rCmupUaMx6qUdtu4JoZsMFzElfm+ID4B
         A19A==
X-Gm-Message-State: AOJu0Yxl+1Cxsz+uwnTo56y4LKKAxImXYBdAbwvYo8V96rTZ6glBAdXr
	f2ha6O6XWfLwglt3kVtUoxjoDA==
X-Google-Smtp-Source: AGHT+IGVEi/PRYeOqTtzx04zjIE+hKpB0dXKgdrcMW055Vdgu+3A9wH2l1LOQoQWi9DMm9V3UPA/MA==
X-Received: by 2002:a05:6808:2e99:b0:3b9:fe98:39af with SMTP id gt25-20020a0568082e9900b003b9fe9839afmr25463946oib.6.1702997314360;
        Tue, 19 Dec 2023 06:48:34 -0800 (PST)
X-BeenThere: linux-cachefs@redhat.com
Received: by 2002:ad4:4ea7:0:b0:670:a1c0:e4e2 with SMTP id ed7-20020ad44ea7000000b00670a1c0e4e2ls2723798qvb.1.-pod-prod-04-us;
 Tue, 19 Dec 2023 06:48:33 -0800 (PST)
X-Received: by 2002:a37:c444:0:b0:781:c22:8b8e with SMTP id h4-20020a37c444000000b007810c228b8emr183828qkm.48.1702997313787;
        Tue, 19 Dec 2023 06:48:33 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1702997313; cv=none;
        d=google.com; s=arc-20160816;
        b=E5hYkfB6PteS04xbfyO7yruPwR+J6jl8Ycxrt7a7WDKGWWLcqZHG4eHPhE8588eG+p
         H7eqtu+p/TrlKksNz+Lq3a/1BWV8g0dBOTY96OmvoKZeqd1xlQvKUCiHdLalKGyLPAgA
         yIiI9LsiJLvtbYlLts5ogc8m6L3axuzfQD0L2ocVv3oBO2bZFbm9gCAnzyvFzIRLMjOa
         dYwU9ADzHmnhIEe54HWfJHembzOolOYX5RQkiUVdJX6EbFSoEj5GXrM6zYqkoXj6UjqK
         Q3RGudQcUI0nBkeE+bVzuLJ/m07FlODfncB0eXCM1qXQlioahHkYEvq4QAinYmYTK2XU
         YrEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-id:message-id:date:mime-version:subject:cc:to:references
         :in-reply-to:from:organization:delivered-to;
        bh=UWtsZhR3mqpEo9xJldP9MDyJRchqzHme83vu4hlTHKQ=;
        fh=oTSheoojIQWE85h15wIbFV5tdQ792s9VwZPsELvSY7c=;
        b=E5Cb2tOenusmsR6XeipIVqfA5Nk7/gZY1cfcfEtkpyLKmATLkbJQw37LOvGfuyHREc
         jMzDfd+sVisNIrUKdvc5LQavBzwyfFp0nvCIW5Y6WuzrdVMS3/Yakwt1IraYU+D4PKL7
         bOBPCk2q9qP/bggVf0QszNQ15slysEUxWH9SqowV0QGKGMBYF49e3qsjs0uA9nzQO1PP
         CdmcbaFMKImTLnly4Zx2n8fZ2OnlzHl5RJ7Vjly8wnhrG/y5NISgtX5RX+lo9to54m6p
         f9cBaiqK2PDcxCtkvQHiFgN78IExy1azEFP6OHsiq4Y4aJ1ja/9WSuaG8frZqjgVCszT
         G6uw==
ARC-Authentication-Results: i=1; mx.google.com;
       gateway.spf=pass (google.com: domain gapps.redhat.com configured 207.211.31.120 as internal address) smtp.mailfrom=dhowells@redhat.com smtp.remote-ip=207.211.31.120 policy.d=gapps.redhat.com
Received: from us-smtp-inbound-delivery-1.mimecast.com (us-smtp-delivery-1.mimecast.com. [207.211.31.120])
        by mx.google.com with ESMTPS id cx19-20020a05620a51d300b0077dcd3716ffsi25208092qkb.745.2023.12.19.06.48.33
        for <linux-cachefs@gapps.redhat.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Dec 2023 06:48:33 -0800 (PST)
Received-SPF: pass (google.com: domain gapps.redhat.com configured 207.211.31.120 as internal address)
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-261-bKlv9I3xMuSY3kLZ16U40w-1; Tue, 19 Dec 2023 09:48:31 -0500
X-MC-Unique: bKlv9I3xMuSY3kLZ16U40w-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com [10.11.54.3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 673FE882320
	for <linux-cachefs@gapps.redhat.com>; Tue, 19 Dec 2023 14:48:31 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
	id 6144B112132A; Tue, 19 Dec 2023 14:48:31 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.uk (unknown [10.39.195.169])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 936FD1121306;
	Tue, 19 Dec 2023 14:48:28 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
	Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
	Kingdom.
	Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
In-Reply-To: <488867.1702996927@warthog.procyon.org.uk>
References: <488867.1702996927@warthog.procyon.org.uk> <6f8c3f22f77e9e0154f4131260559c39d6740678.camel@kernel.org> <20231213152350.431591-1-dhowells@redhat.com> <20231213152350.431591-19-dhowells@redhat.com>
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
Subject: Re: [PATCH v4 18/39] netfs: Export netfs_put_subrequest() and some tracepoints
MIME-Version: 1.0
Date: Tue, 19 Dec 2023 14:48:27 +0000
Message-ID: <489637.1702997307@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.3
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-ID: <489636.1702997307.1@warthog.procyon.org.uk>
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

David Howells <dhowells@redhat.com> wrote:

> Jeff Layton <jlayton@kernel.org> wrote:
> 
> > Erm...why? Are these called directly from module code in a later patch?
> 
> Yes.  I'll expand the commit message.

That said, only trace_netfs_sreq() is required.  The other two can be dropped.

David

-- 
You received this message because you are subscribed to the Google Groups "linux-cachefs@redhat.com" group.
To unsubscribe from this group and stop receiving emails from it, send an email to linux-cachefs+unsubscribe@redhat.com.

