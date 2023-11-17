Return-Path: <linux-cachefs+bncBDLIXLMFVAERB6ER36VAMGQEB3SNEOY@redhat.com>
X-Original-To: lists+linux-cachefs@lfdr.de
Delivered-To: lists+linux-cachefs@lfdr.de
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mail.lfdr.de (Postfix) with ESMTPS id B26CD7EF82E
	for <lists+linux-cachefs@lfdr.de>; Fri, 17 Nov 2023 21:11:37 +0100 (CET)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-66d026cae6esf28514746d6.3
        for <lists+linux-cachefs@lfdr.de>; Fri, 17 Nov 2023 12:11:37 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1700251896; cv=pass;
        d=google.com; s=arc-20160816;
        b=IlnVbU6fRUJ/4DnL4QOOLDLaHCbe1PNgU4qLWWF6fgrYHuWVDWzi58AIY2/LFBuGrG
         d/pPJ5HQoNuDpI9sWkd1AI+a8sGUNc/2l3FXAf+fpH0gk+JsyikKo9E1QPYo9LBlp79z
         iqdlyXhWLBjtNHtuOuykuYcrBkw9X8SGTv8r6/d7BpD8wQrvliuXl5nY78cPUCvx6TBm
         YFAaq4E45+H8UBN8KW3ojfr/wDv3oTAG/LwTBSAGgfa6sWdwz3MBXShNcyBKsKYFehQM
         BsRGv01VyCsUXS5Ch74Qiv0quDm8E9WJu+gWmlvgiwIuQyCxAMRm/6DMl0GNeVqYMaII
         oKaw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-archive:list-help:list-post:list-id
         :mailing-list:precedence:content-id:message-id:date:mime-version
         :subject:cc:to:references:in-reply-to:from:organization:delivered-to;
        bh=7WXCwnI99lMmfUuiuQCIqrvTxTnAVpoHRp8BQ5Xlvu8=;
        fh=sSAx+bUtldeKgKS5wET1oNYyKD1uRKp33QFaO2SDcsM=;
        b=y0kF4x52SxyOw8JB1G8goF+/a6F6urg+7vW70W3PRIp5vrGgfuAwlUS7bD0uEX1IPw
         +N2K1yDSzAJD99eCqJDmz3bPjThfVf6X627oJmb41SbBZB/2jD2OCnP3dqPPa378D2fo
         0u3hqoiIWanC3KY2xctDIiF6Flhktz6fHN/VpGgFu9uFzwZ1OqVMhh4i0fEMirBPMzQx
         nN7zgy+OfJBOB3NL9xoWKE0c0DmSbQsSAginSv1/NNqgQHVv9pQgYIXJ1lSSQPYvQZMf
         20vXG+zfeuydtbKWnqZj0dKGOv8jpv4GE8b+VSt8FJkcjsh34Gbm4d7XX8zK20opkcHu
         zgXw==
ARC-Authentication-Results: i=2; mx.google.com;
       spf=pass (google.com: domain gapps.redhat.com configured 207.211.31.120 as internal address) smtp.mailfrom=dhowells@redhat.com
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700251896; x=1700856696;
        h=list-unsubscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender:content-id
         :message-id:date:mime-version:subject:cc:to:references:in-reply-to
         :from:organization:delivered-to:x-beenthere:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=7WXCwnI99lMmfUuiuQCIqrvTxTnAVpoHRp8BQ5Xlvu8=;
        b=YqVbrJE83+ABYRwUH9gJiImvma8tBgmDXX5hZmO3FYbtf1E0l0lNLpenYtC7O/YXh8
         j3BRocItpXwPmcWfbC/VbBQ696PSctK6BmdXGpYbEX/57oMIlOaua90/HfoW1beVmCNo
         L8xzoNlfHNOLBZbnWeYL6lckyYG+mkZnCGuxSf4Q6KvrmyMOSdI1cla9UUtaoG2/DA3S
         R5MBj9yo1LsocRHZxkJceidOGqStdIVdDVk9rGTjp8UhZU2wB+CPxnf8NtXXvM96ti0o
         yq4RdSOmVzJmvXdh1NkINxSm3aJxjs8gVR4mI4enlSjlhwbr4MwaMIz86gFNYJaX5GZ5
         agsg==
X-Gm-Message-State: AOJu0YwkeSxC6wIsRdQ9UoeR5lihptmoBm/e73tLJhAGpdcGTn4RgSnv
	LqOWaLZuyxmT/d9ZBuqjgydElQ==
X-Google-Smtp-Source: AGHT+IErNvjxQMpHCbjvQMBZKzmTm4DBlFF4coRjizHudg3ZFWFmFgi35wREdIxfU33AvstqwHTgYg==
X-Received: by 2002:ad4:5ccd:0:b0:658:71e1:5490 with SMTP id iu13-20020ad45ccd000000b0065871e15490mr177887qvb.21.1700251896568;
        Fri, 17 Nov 2023 12:11:36 -0800 (PST)
X-BeenThere: linux-cachefs@redhat.com
Received: by 2002:a0c:cd81:0:b0:65a:f624:1956 with SMTP id v1-20020a0ccd81000000b0065af6241956ls1523567qvm.2.-pod-prod-09-us;
 Fri, 17 Nov 2023 12:11:36 -0800 (PST)
X-Received: by 2002:a0c:e0c5:0:b0:670:fa29:eb51 with SMTP id x5-20020a0ce0c5000000b00670fa29eb51mr167348qvk.12.1700251895871;
        Fri, 17 Nov 2023 12:11:35 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1700251895; cv=none;
        d=google.com; s=arc-20160816;
        b=V2/9LYmkLt4JaN+yS3Uks6IkS4G8RgLdpxNN9N1oHJySHLxeMUGKACC8dmlw3IBCjS
         wY38eDsaD1GCL3AShoLomBaZM85m4Akti3AryYV6UIBqWWZadWXwCRBsOYrqnxBVT0p0
         Nkl1uBarBdu1n8Fn0vvtjocUBqdaTGZ0kV0Ay4TveJtBnh72rcRlKBgQoL3ZEsG0TUVu
         zZTheLQvTcJJKgeOtK0kvusH4ZyAoHmEQpA+k2nd/ybf8V2mjr5Au/NdnKS3ik/28rqT
         XzkUcagYYmF1VbB6BM3e2o0LxiO5WqSw4n1Ahllb7Fq/A05kuifozN73gwHwnXahL1nz
         tX9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-id:message-id:date:mime-version:subject:cc:to:references
         :in-reply-to:from:organization:delivered-to;
        bh=ksp0B0U0jOk91nyenu4kLAdaKIM4KJ+zFPMizD4PhnM=;
        fh=sSAx+bUtldeKgKS5wET1oNYyKD1uRKp33QFaO2SDcsM=;
        b=zf7JwRaYN6eSXOjTCypCLC+ubiK7keVZ1nYyPLXXbbdVj+z1UyQuTzpzj4TKL/FMsE
         wfPX7DcMEq9q4ayuiM/oxGNOtxtrI7u/6ezsHWymyxLrZVMQY7NeLF9BekQt181s8HDC
         n9eIffHSJ3c9+2HW5FzIvDIeZCM8Ew2Wj0npH+wjDKw7vFRD5YySeVd4JfzQfMFPaxnI
         hl8S75c48PWH0SQXBm/HzIb8a5GaNkEPwBEFtMWVJcJRRgMF3Td0uhT2l4OUMMJoDL5h
         viSlAZ6cArmxmFYMVILI2OymHvGn0XQectp5ct1StkQSpU1dZ4J+rwYQZM5q3ROV0L3k
         gjOQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain gapps.redhat.com configured 207.211.31.120 as internal address) smtp.mailfrom=dhowells@redhat.com
Received: from us-smtp-inbound-delivery-1.mimecast.com (us-smtp-inbound-delivery-1.mimecast.com. [207.211.31.120])
        by mx.google.com with ESMTPS id m11-20020a0cfbab000000b00677f81c965esi1536199qvp.141.2023.11.17.12.11.35
        for <linux-cachefs@gapps.redhat.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Nov 2023 12:11:35 -0800 (PST)
Received-SPF: pass (google.com: domain gapps.redhat.com configured 207.211.31.120 as internal address)
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-683-PX-LdFiuN-eSLsxD71zP3w-1; Fri, 17 Nov 2023 15:11:34 -0500
X-MC-Unique: PX-LdFiuN-eSLsxD71zP3w-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0809A83FC2B
	for <linux-cachefs@gapps.redhat.com>; Fri, 17 Nov 2023 20:11:34 +0000 (UTC)
Received: by smtp.corp.redhat.com (Postfix)
	id 04E6FC0BDC2; Fri, 17 Nov 2023 20:11:34 +0000 (UTC)
Delivered-To: linux-cachefs@redhat.com
Received: from warthog.procyon.org.uk (unknown [10.42.28.16])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 4779AC0BDC0;
	Fri, 17 Nov 2023 20:11:31 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
	Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
	Kingdom.
	Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
In-Reply-To: <9d2fc137b4295058ac3f88f1cca7a54bc67f01fd.camel@kernel.org>
References: <9d2fc137b4295058ac3f88f1cca7a54bc67f01fd.camel@kernel.org> <20231013160423.2218093-1-dhowells@redhat.com> <20231013160423.2218093-13-dhowells@redhat.com>
To: Jeff Layton <jlayton@kernel.org>
Cc: dhowells@redhat.com, Steve French <smfrench@gmail.com>,
    Matthew Wilcox <willy@infradead.org>,
    Marc Dionne <marc.dionne@auristor.com>,
    Paulo Alcantara <pc@manguebit.com>,
    Shyam Prasad N <sprasad@microsoft.com>, Tom Talpey <tom@talpey.com>,
    Dominique Martinet <asmadeus@codewreck.org>,
    Ilya Dryomov <idryomov@gmail.com>,
    Christian Brauner <christian@brauner.io>,
    linux-afs@lists.infradead.org, linux-cifs@vger.kernel.org,
    linux-nfs@vger.kernel.org, ceph-devel@vger.kernel.org,
    v9fs@lists.linux.dev, linux-fsdevel@vger.kernel.org,
    linux-mm@kvack.org, netdev@vger.kernel.org,
    linux-kernel@vger.kernel.org, linux-cachefs@redhat.com
Subject: Re: [RFC PATCH 12/53] netfs: Provide tools to create a buffer in an xarray
MIME-Version: 1.0
Date: Fri, 17 Nov 2023 20:11:30 +0000
Message-ID: <1709498.1700251890@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.8
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-ID: <1709497.1700251890.1@warthog.procyon.org.uk>
X-Original-Sender: dhowells@redhat.com
X-Original-Authentication-Results: mx.google.com;       spf=pass (google.com:
 domain gapps.redhat.com configured 207.211.31.120 as internal address) smtp.mailfrom=dhowells@redhat.com
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

> Some kerneldoc comments on these new helpers would be nice. I assume
> that "index" and "to" are "start" and "end" for this, but it'd be nice
> to make that explicit.

These are internal to netfs not API functions, so they shouldn't appear in the
API docs.  That's why the declaration is in internal.h, not netfs.h.

That said, I could describe them better.

> > +	ret = netfs_add_folios_to_buffer(buffer, mapping, want_index,
> > +					 have_index - 1, gfp_mask);
> > +	if (ret < 0)
> > +		return ret;
> > +	have_folios += have_index - want_index;
> > +
> > +	ret = netfs_add_folios_to_buffer(buffer, mapping,
> > +					 have_index + have_folios,
> > +					 want_index + want_folios - 1,
> > +					 gfp_mask);
> 
> I don't get it. Why are you calling netfs_add_folios_to_buffer twice
> here? Why not just make one call? Either way, a comment here explaining
> that would also be nice.

The ranges aren't contiguous.  They bracket the folios spliced from the
mapping.  That being said, I seem to have lost a bit of maths somewhere.

Further, I'm not now using netfs_add_folios_to_buffer(), so I'll remove it.

David

-- 
You received this message because you are subscribed to the Google Groups "linux-cachefs@redhat.com" group.
To unsubscribe from this group and stop receiving emails from it, send an email to linux-cachefs+unsubscribe@redhat.com.

